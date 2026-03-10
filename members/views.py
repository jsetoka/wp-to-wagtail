# members/views.py
from decimal import Decimal, InvalidOperation
from django.db.models import Q
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, get_object_or_404, redirect

from members.models import MemberAnnualDues, AnnualFee, Payment
from members.services import MtnMomoClient, MtnMomoError

from django.core.exceptions import PermissionDenied

from django.db.models import Sum, F, Value, DecimalField
from django.db.models.functions import Coalesce

from members.models import Member



from .models import MemberProfile


@login_required
def dues_list(request):
    try:
        member = request.user.member_profile
    except MemberProfile.DoesNotExist:
        messages.error(request, "Aucun profil membre n’est associé à votre compte.")
        return render(
            request,
            "members/dues_list.html",
            {
                "dues": [],
                "member": None,
            },
        )

    dues = (
        MemberAnnualDues.objects
        .filter(member=member)
        .select_related("fee")
        .order_by("-fee__year")
    )

    return render(
        request,
        "members/dues_list.html",
        {
            "dues": dues,
            "member": member,
        },
    )

@login_required
def dues_detail(request, year: int):
    member = request.user.member_profile
    fee = get_object_or_404(AnnualFee, year=year)
    dues = get_object_or_404(MemberAnnualDues, member=member, fee=fee)

    if request.method == "POST":
        try:
            amount = Decimal(request.POST.get("amount", "0") or "0")
        except InvalidOperation:
            amount = Decimal("0")

        method = request.POST.get("method", Payment.METHOD_MOBILE)
        phone_number = (request.POST.get("phone_number") or "").strip()

        if amount <= 0:
            messages.error(request, "Le montant doit être supérieur à 0.")
            return redirect("dues_detail", year=year)

        if amount > dues.balance:
            messages.error(request, "Le montant dépasse le reste à payer.")
            return redirect("dues_detail", year=year)

        if method == Payment.METHOD_MOBILE:
            if not phone_number:
                messages.error(request, "Veuillez saisir un numéro MTN Mobile Money.")
                return redirect("dues_detail", year=year)

            payment = Payment.objects.create(
                dues=dues,
                amount=amount,
                method=Payment.METHOD_MOBILE,
                provider=Payment.PROVIDER_MTN_CG,
                payer_phone=phone_number,
                status=Payment.STATUS_INITIATED,
                external_id=str(dues.id),
            )

            client = MtnMomoClient()
            try:
                result = client.request_to_pay(
                    payment=payment,
                    phone_number=phone_number,
                    payer_message=f"Cotisation {dues.fee.year}",
                    payee_note=f"Paiement cotisation {dues.fee.year}",
                )

                payment.provider_reference = result["reference_id"]
                payment.reference = result["reference_id"]

                payment.mark_pending(payload=result)
                payment.save(update_fields=["provider_reference", "reference", "status", "provider_payload"])

                messages.success(
                    request,
                    "Demande de paiement envoyée. Veuillez valider sur votre téléphone."
                )
            except MtnMomoError as e:
                payment.fail(payload={"error": str(e)}, provider_status="REQUEST_FAILED")
                messages.error(request, f"Le paiement mobile a échoué: {e}")

            return redirect("dues_detail", year=year)

        # paiements manuels
        payment = Payment.objects.create(
            dues=dues,
            amount=amount,
            method=method,
            status=Payment.STATUS_INITIATED,
        )
        payment.confirm()
        messages.success(request, "Paiement enregistré.")
        return redirect("dues_detail", year=year)

    payments = dues.payments.order_by("-initiated_at", "-confirmed_at")
    return render(
        request,
        "members/dues_detail.html",
        {"dues": dues, "payments": payments}
    )


@login_required
def admin_cotisation_list(request):
    if not request.user.is_staff:
        raise PermissionDenied

    qs = (
        MemberAnnualDues.objects
        .select_related("member", "fee", "member__user")
        .order_by("-fee__year", "member__user__username")
    )

    year = request.GET.get("year", "").strip()
    status = request.GET.get("status", "").strip()
    q = request.GET.get("q", "").strip()

    if year:
        try:
            year = int(year)
            qs = qs.filter(fee__year=year)
        except (TypeError, ValueError):
            year = None

    if status in {"due", "partial", "paid"}:
        qs = qs.filter(status=status)

    if q:
        qs = qs.filter(
            Q(member__user__username__icontains=q) |
            Q(member__user__first_name__icontains=q) |
            Q(member__user__last_name__icontains=q) |
            Q(member__user__email__icontains=q) |
            Q(member__member_no__icontains=q)
        )

    total_due = qs.aggregate(
        total=Coalesce(Sum("amount_due"), Value(0), output_field=DecimalField(max_digits=12, decimal_places=2))
    )["total"]

    total_paid = sum((due.amount_paid for due in qs), Decimal("0"))
    total_balance = sum((due.balance for due in qs), Decimal("0"))

    summary = {
        "total_due": total_due,
        "total_paid": total_paid,
        "total_balance": total_balance,
    }

    years = (
        MemberAnnualDues.objects
        .values_list("fee__year", flat=True)
        .distinct()
        .order_by("-fee__year")
    )

    context = {
        "dues": qs,
        "years": years,
        "selected_year": year,
        "selected_status": status,
        "search_query": q,
        "summary": summary,
        "status_choices": [
            ("due", "À payer"),
            ("partial", "Partiel"),
            ("paid", "Payé"),
        ],
    }
    return render(request, "members/admin_cotisation_list.html", context)





import hmac
import hashlib
from urllib.parse import urlencode

import base64
from io import BytesIO
from urllib.parse import urlencode

import qrcode

from django.conf import settings
from django.http import HttpResponse, HttpResponseForbidden
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
        "members/invoice_pdf.html",
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
        "members/verify_invoice.html",
        {
            "payment": payment,
            "is_valid": is_valid,
            "error": error,
        },
    )