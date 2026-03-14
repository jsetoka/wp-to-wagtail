from django.urls import path

from payment.views import latest_payment_status_api, payment_invoice_pdf
from payment.views_momo import check_momo_payment


urlpatterns = [
    path("<int:payment_id>/invoice.pdf", payment_invoice_pdf, name="payment_invoice_pdf"),
    path("<int:payment_id>/check/", check_momo_payment, name="check_momo_payment"),
    path("status/latest", latest_payment_status_api, name="latest_payment_status_api"),
]
