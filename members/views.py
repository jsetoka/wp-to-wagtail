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