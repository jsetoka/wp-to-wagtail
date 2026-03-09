# members/views_momo.py
import json
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt

from members.models import Payment
from members.services import MtnMomoClient, MtnMomoError

from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404, redirect



@login_required
def check_momo_payment(request, payment_id):
    payment = get_object_or_404(
        Payment,
        id=payment_id,
        dues__member=request.user.member_profile,
        provider=Payment.PROVIDER_MTN_CG,
    )

    client = MtnMomoClient()
    try:
        data = client.get_request_status(payment.provider_reference)
        status = (data.get("status") or "").upper()

        payment.provider_status = status
        payment.provider_payload = data
        payment.save(update_fields=["provider_status", "provider_payload"])

        if status == "SUCCESSFUL":
            if payment.status != Payment.STATUS_CONFIRMED:
                payment.confirm(payload=data)
            messages.success(request, "Paiement confirmé.")
        elif status in {"FAILED", "REJECTED", "TIMEOUT"}:
            payment.fail(payload=data, provider_status=status)
            messages.error(request, f"Paiement échoué: {status}")
        else:
            payment.mark_pending(payload=data)
            messages.info(request, f"Paiement encore en attente: {status}")

    except MtnMomoError as e:
        messages.error(request, f"Impossible de vérifier le paiement: {e}")

    return redirect("dues_detail", year=payment.dues.fee.year)