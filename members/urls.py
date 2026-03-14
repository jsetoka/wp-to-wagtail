from django.urls import path

from members.views import AddMemberAnnualDuesView, admin_cotisation_list, dues_detail, dues_list
from payment.views import verify_invoice

app_name = "members"

urlpatterns = [
    path("cotisations/", dues_list, name="dues_list"),
    path("cotisations/<int:year>/", dues_detail, name="dues_detail"),

    path("dues/", dues_list, name="dues_list"),
    path("dues/<int:year>/", dues_detail, name="dues_detail"),
    path("admin/cotisations/", admin_cotisation_list, name="admin_cotisation_list"),
    path("verify-invoice/", verify_invoice, name="verify_invoice"),
    path("<int:pk>/dues/add/", AddMemberAnnualDuesView.as_view(), name="add_member_dues"),
]