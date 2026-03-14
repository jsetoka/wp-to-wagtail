
from django.http import HttpResponse, HttpResponseForbidden
from django.shortcuts import render, get_object_or_404

from django.conf import settings
from payment.models import Payment

import hmac
import hashlib
from urllib.parse import urlencode

import base64, qrcode
from io import BytesIO

from django.template.loader import render_to_string
from django.contrib.auth.decorators import login_required
from weasyprint import HTML


def build_invoice_signature(payment):
    payload = f"{payment.id}|{payment.dues.fee.year}|{payment.amount}|{payment.status}"
    import hmac
    import hashlib
    return hmac.new(
        settings.SECRET_KEY.encode(),
        payload.encode(),
        hashlib.sha256,
    ).hexdigest()


@login_required
def payment_invoice_pdf(request, payment_id):
    payment = get_object_or_404(
        Payment.objects.select_related("dues", "dues__fee", "dues__member"),
        id=payment_id,
        status="confirmed",
    )

    member = getattr(payment.dues, "member", None)
    if member and hasattr(member, "user"):
        if member.user != request.user and not request.user.is_staff:
            return HttpResponseForbidden("Accès refusé.")

    invoice_number = f"FAC-{payment.id:06d}-{payment.dues.fee.year}"

    signature = build_invoice_signature(payment)

    query = urlencode({
        "payment": payment.id,
        "year": payment.dues.fee.year,
        "amount": payment.amount,
        "sig": signature,
    })

    verify_url = request.build_absolute_uri(f"/me/verify-invoice/?{query}")

    qr = qrcode.make(verify_url)
    buffer = BytesIO()
    qr.save(buffer, format="PNG")
    qr_base64 = base64.b64encode(buffer.getvalue()).decode()

    html_string = render_to_string(
        "payment/invoice_pdf.html",
        {
            "payment": payment,
            "dues": payment.dues,
            "fee": payment.dues.fee,
            "member": member,
            "invoice_number": invoice_number,
            "qr_code": qr_base64,
            "verify_url": verify_url,
        },
    )

    pdf_file = HTML(
        string=html_string,
        base_url=request.build_absolute_uri("/")
    ).write_pdf()

    response = HttpResponse(pdf_file, content_type="application/pdf")
    response["Content-Disposition"] = f'attachment; filename="facture-paiement-{payment.id}.pdf"'
    return response


def verify_invoice(request):
    payment_id = request.GET.get("payment")
    year = request.GET.get("year")
    amount = request.GET.get("amount")
    provided_sig = request.GET.get("sig", "")
    
    is_valid = False
    payment = None
    error = None

    if not payment_id:
        error = "Paramètre payment manquant."
    else:
        try:
            payment = get_object_or_404(
                Payment.objects.select_related("dues", "dues__fee", "dues__member"),
                id=payment_id,
            )

            expected_sig = build_invoice_signature(payment)

            # compare sécurisée
            sig_ok = hmac.compare_digest(provided_sig, expected_sig)
            year_ok = str(payment.dues.fee.year) == str(year)
            amount_ok = str(payment.amount) == str(amount)
            status_ok = payment.status == "confirmed"

            is_valid = sig_ok and year_ok and amount_ok and status_ok

            if not is_valid:
                error = "Cette facture est invalide ou a été altérée."

        except Exception:
            error = "Facture introuvable."

    return render(
        request,
        "payment/verify_invoice.html",
        {
            "payment": payment,
            "is_valid": is_valid,
            "error": error,
        },
    )


from django.http import JsonResponse
from django.shortcuts import get_object_or_404
from django.contrib.auth.decorators import login_required

from payment.models import Payment
from payment.momo_services import process_momo_payment_check
from payment.services import MtnMomoError


@login_required
def latest_payment_status_api(request):
    payment = Payment.objects.filter(
        dues__member=request.user.member_profile,
        status=Payment.STATUS_PENDING
    ).order_by("-initiated_at").first()

    if not payment:
        return JsonResponse({
            "payment_id": None,
            "status": None,
            "message": "Aucun paiement trouvé."
        }, status=404)

    if payment.status == Payment.STATUS_PENDING and payment.provider_reference:
        try:
            process_momo_payment_check(payment)
            payment.refresh_from_db()
        except MtnMomoError:
            pass

    return JsonResponse({
        "payment_id": payment.id,
        "status": payment.status,
        "provider_status": payment.provider_status,
        "confirmed_at": payment.confirmed_at.isoformat() if payment.confirmed_at else None,
        "failed_at": payment.failed_at.isoformat() if payment.failed_at else None,
    })