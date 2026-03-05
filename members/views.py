# members_portal/views.py
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, get_object_or_404, redirect
from decimal import Decimal
from members.models import MemberAnnualDues, AnnualFee, Payment

@login_required
def dues_list(request):
    member = request.user.member_profile
    dues = MemberAnnualDues.objects.filter(member=member).select_related("fee").order_by("-fee__year")
    return render(request, "members/dues_list.html", {"dues": dues, "member":request.user})

@login_required
def dues_detail(request, year: int):
    member = request.user.member_profile
    fee = get_object_or_404(AnnualFee, year=year)
    dues = get_object_or_404(MemberAnnualDues, member=member, fee=fee)

    if request.method == "POST":
        amount = Decimal(request.POST.get("amount", "0") or "0")
        method = request.POST.get("method", Payment.METHOD_MOBILE)

        if amount > 0 and amount <= dues.balance:
            payment = Payment.objects.create(
                dues=dues, amount=amount, method=method, status=Payment.STATUS_INITIATED
            )
            # Si paiement manuel: confirmer direct (ou laisser admin confirmer)
            payment.confirm()
            return redirect("dues_detail", year=year)

    payments = dues.payments.order_by("-initiated_at")
    return render(request, "members/dues_detail.html", {"dues": dues, "payments": payments})