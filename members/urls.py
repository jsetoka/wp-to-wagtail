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
]