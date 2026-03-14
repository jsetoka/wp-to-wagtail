# members/views.py
from decimal import Decimal, InvalidOperation
import uuid
from django.db.models import Q
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, get_object_or_404, redirect

from adhesions.mixins import OICStaffRequiredMixin
from members.models import MemberAnnualDues, AnnualFee
from payment.models import Payment
from payment.services import MtnMomoClient, MtnMomoError

from django.core.exceptions import PermissionDenied
from django.db.models import Sum, Value, DecimalField
from django.db.models.functions import Coalesce
from django.views import View
from .forms import MemberAnnualDuesForm
from decimal import Decimal
from django.urls import reverse

from adhesions.models import Application
from members.models import MemberProfile


def get_current_member_profile(user):
    try:
        return user.member_profile
    except MemberProfile.DoesNotExist:
        return None


@login_required
def dashboard(request):
    #  member = get_current_member_profile(request.user)
    member = MemberProfile.objects.get(user=request.user)

    current_application = None
    total_due = Decimal("0")
    total_paid = Decimal("0")
    last_unpaid_year = None
    dues = MemberAnnualDues.objects.none()

    if member:
        dues = (
            MemberAnnualDues.objects
            .filter(member=member)
            .select_related("fee")
            .order_by("-fee__year")
        )

        total_due = dues.aggregate(
            total=Coalesce(
                Sum("amount_due"),
                Value(0),
                output_field=DecimalField(max_digits=12, decimal_places=2),
            )
        )["total"] or Decimal("0")

        total_paid = sum((due.amount_paid for due in dues), Decimal("0"))

        unpaid_due = dues.exclude(status="paid").order_by("fee__year").first()
        if unpaid_due and unpaid_due.fee:
            last_unpaid_year = unpaid_due.fee.year

    applications = (
        Application.objects
        .filter(candidate=request.user.candidate_profile)
        .order_by("-created_at")
    )
    current_application = applications.first()

    account_status = None
    member_number = None

    if member:
        member_number = getattr(member, "member_no", None)
        account_status = member.is_active_member

    applications_url = None
    documents_url = None
    profile_url = None

    try:
        applications_url = reverse("adhesions:my_applications")
    except Exception:
        pass

    try:
        documents_url = reverse("members:documents")
    except Exception:
        pass

    try:
        profile_url = reverse("members:profile")
    except Exception:
        pass

    if not member:
        messages.warning(
            request,
            "Aucun profil membre n’est actuellement associé à votre compte."
        )

    context = {
        "member": member,
        "member_number": member_number,
        "account_status": account_status,
        "dues_summary": {
            "total_due": total_due,
            "total_paid": total_paid,
            "last_unpaid_year": last_unpaid_year,
        },
        "dues": dues[:5],
        "current_application": current_application,
        "applications_url": applications_url,
        "documents_url": documents_url,
        "profile_url": profile_url,
    }

    return render(request, "members/dashboard.html", context)


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
            return redirect("members:dues_detail", year=year)

        if amount > dues.balance:
            messages.error(request, "Le montant dépasse le reste à payer.")
            return redirect("members:dues_detail", year=year)

        if method == Payment.METHOD_MOBILE:
            if not phone_number:
                messages.error(request, "Veuillez saisir un numéro MTN Mobile Money.")
                return redirect("members:dues_detail", year=year)

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

            return redirect("members:dues_detail", year=year)
        else:
            # paiements manuels
            payment = Payment.objects.create(
                dues=dues,
                amount=amount,
                method=method,
                reference=str(uuid.uuid4()),
                status=Payment.STATUS_INITIATED,
            )
            payment.mark_pending()
            messages.success(request, "Paiement enregistré.")
            return redirect("members:dues_detail", year=year)

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


@login_required
def admin_dues_payments_detail(request, pk):
    if not request.user.is_staff:
        raise PermissionDenied

    dues = get_object_or_404(
        MemberAnnualDues.objects.select_related("member", "member__user", "fee"),
        pk=pk,
    )

    payments = dues.payments.order_by("-initiated_at", "-confirmed_at", "-id")

    context = {
        "dues": dues,
        "payments": payments,
    }
    return render(request, "members/admin_dues_payments_detail.html", context)



class AddMemberAnnualDuesView(OICStaffRequiredMixin, View):
    template_name = "members/add_member_annual_dues.html"

    def get(self, request, pk):
        member = get_object_or_404(MemberProfile, pk=pk)
        form = MemberAnnualDuesForm(member=member)
        return render(request, self.template_name, {
            "member": member,
            "form": form,
        })

    def post(self, request, pk):
        member = get_object_or_404(MemberProfile, pk=pk)
        form = MemberAnnualDuesForm(request.POST, member=member)

        if form.is_valid():
            fee = form.cleaned_data["fee"]

            dues, created = MemberAnnualDues.objects.get_or_create(
                member=member,
                fee=fee,
                defaults={
                    "amount_due": fee.amount,
                    "status": MemberAnnualDues.STATUS_DUE,
                },
            )

            if created:
                messages.success(request, "Cotisation annuelle ajoutée au membre.")
            else:
                messages.warning(request, "Cette cotisation existe déjà pour ce membre.")

            return redirect("members:member_detail", pk=member.pk)

        return render(request, self.template_name, {
            "member": member,
            "form": form,
        })


from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect

from .forms import MemberProfileUpdateForm
from .models import MemberProfile


@login_required
def profile(request):
    member = MemberProfile.objects.filter(user=request.user).first()

    if request.method == "POST":
        form = MemberProfileUpdateForm(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            messages.success(request, "Votre profil a été mis à jour avec succès.")
            return redirect("members:profile")
    else:
        form = MemberProfileUpdateForm(instance=request.user)

    return render(
        request,
        "members/profile.html",
        {
            "member": member,
            "form": form,
        },
    )

@login_required
def approve_payment(request, pk):
    if not request.user.is_staff:
        raise PermissionDenied

    if request.method != "POST":
        raise PermissionDenied

    payment = get_object_or_404(Payment.objects.select_related("dues"), pk=pk)

    # Autoriser uniquement pending -> approved
    if payment.status != payment.STATUS_PENDING:
        messages.error(
            request,
            "Seuls les paiements en attente peuvent être approuvés."
        )
        return redirect("members:admin_dues_payments_detail", pk=payment.dues.pk)

    payment.status = payment.STATUS_CONFIRMED 

    if hasattr(payment, "confirmed_at"):
        from django.utils import timezone
        payment.confirmed_at = timezone.now()
        payment.save(update_fields=["status", "confirmed_at"])
    else:
        payment.save(update_fields=["status"])

    messages.success(request, "Le paiement a été approuvé avec succès.")
    return redirect("members:admin_dues_payments_detail", pk=payment.dues.pk)