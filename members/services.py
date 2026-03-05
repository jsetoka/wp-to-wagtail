# members/services.py
from .models import AnnualFee, MemberProfile, MemberAnnualDues

def create_dues_for_year(year: int):
    fee = AnnualFee.objects.get(year=year)
    members = MemberProfile.objects.filter(is_active_member=True)

    created = 0
    for m in members:
        obj, was_created = MemberAnnualDues.objects.get_or_create(
            member=m,
            fee=fee,
            defaults={"amount_due": fee.amount},
        )
        if was_created:
            created += 1
    return created