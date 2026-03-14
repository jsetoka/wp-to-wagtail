from django.urls import path


from members.views import AddMemberAnnualDuesView, admin_cotisation_list, admin_dues_payments_detail, approve_payment, dashboard, dues_detail, dues_list, profile
from payment.views import verify_invoice

app_name = "members"

urlpatterns = [
    path("dashboard/", dashboard, name="dashboard"),
    path("profil/", profile, name="profile"),
    path("cotisations/", dues_list, name="dues_list"),
    path("cotisations/<int:year>/", dues_detail, name="dues_detail"),

    path("dues/", dues_list, name="dues_list"),
    path("dues/<int:year>/", dues_detail, name="dues_detail"),
    path("admin/cotisations/", admin_cotisation_list, name="admin_cotisation_list"),
    path("admin/cotisations/<int:pk>/paiements/", admin_dues_payments_detail, name="admin_dues_payments_detail"),
    path("admin/payments/<int:pk>/approve/", approve_payment, name="approve_payment"),
    path("verify-invoice/", verify_invoice, name="verify_invoice"),
    path("<int:pk>/dues/add/", AddMemberAnnualDuesView.as_view(), name="add_member_dues"),
]