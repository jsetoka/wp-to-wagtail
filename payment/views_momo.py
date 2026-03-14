# payment/views_momo.py
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404, redirect

from payment.models import Payment
from payment.momo_services import process_momo_payment_check
from payment.services import MtnMomoError



@login_required
def check_momo_payment(request, payment_id):
    payment = get_object_or_404(
        Payment,
        id=payment_id,
        dues__member=request.user.member_profile,
        provider=Payment.PROVIDER_MTN_CG,
    )

    try:
        result = process_momo_payment_check(payment)

        if result["result"] == "confirmed":
            messages.success(request, "Paiement confirmé.")
        elif result["result"] == "failed":
            messages.error(request, f"Paiement échoué: {result['status']}")
        else:
            messages.info(request, f"Paiement encore en attente: {result['status']}")

    except MtnMomoError as e:
        messages.error(request, f"Impossible de vérifier le paiement: {e}")

    return redirect("members:dues_detail", year=payment.dues.fee.year)