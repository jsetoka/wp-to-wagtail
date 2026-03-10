from django.urls import path
from . import views
from .views import dues_list, dues_detail
from .views_momo import check_momo_payment

urlpatterns = [
    path("cotisations/", views.dues_list, name="dues_list"),
    path("cotisations/<int:year>/", views.dues_detail, name="dues_detail"),

    path("dues/", dues_list, name="dues_list"),
    path("dues/<int:year>/", dues_detail, name="dues_detail"),
    #path("payments/momo/callback/", momo_callback, name="momo_callback"),
    path("payments/<int:payment_id>/check/", check_momo_payment, name="check_momo_payment"),

    path("admin/cotisations/", views.admin_cotisation_list, name="admin_cotisation_list"),
    #path("payments/<int:payment_id>/invoice/", views.payment_invoice, name="payment_invoice"),
    path("payments/<int:payment_id>/invoice.pdf", views.payment_invoice_pdf, name="payment_invoice_pdf"),
    path("verify-invoice/", views.verify_invoice, name="verify_invoice"),
]