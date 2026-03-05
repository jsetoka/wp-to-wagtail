from django.contrib import admin
from .models import AnnualFee, MemberAnnualDues, Payment, MemberProfile

@admin.register(MemberProfile)
class MemberProfileAdmin(admin.ModelAdmin):
    list_display = ("member_no", "user", "is_active_member")
    search_fields = ("member_no", "user__username", "user__email")

@admin.register(AnnualFee)
class AnnualFeeAdmin(admin.ModelAdmin):
    list_display = ("year", "amount", "currency", "is_open")

@admin.register(MemberAnnualDues)
class MemberAnnualDuesAdmin(admin.ModelAdmin):
    list_display = ("member", "fee", "amount_due", "status")
    list_filter = ("status", "fee__year")

@admin.register(Payment)
class PaymentAdmin(admin.ModelAdmin):
    list_display = ("id", "dues", "amount", "method", "status", "initiated_at", "confirmed_at")
    list_filter = ("status", "method")
    search_fields = ("reference", "dues__member__member_no", "dues__member__user__username")