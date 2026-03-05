from django.urls import path
from . import views

urlpatterns = [
    path("cotisations/", views.dues_list, name="dues_list"),
    path("cotisations/<int:year>/", views.dues_detail, name="dues_detail"),
]