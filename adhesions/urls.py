# adhesions/urls.py

from django.urls import path
from . import views

app_name = "adhesions"

urlpatterns = [
    path("start/", views.application_start, name="application_start"),
    path("applications/", views.ApplicationListView.as_view(), name="application_list"),
    path("applications/<int:pk>/", views.ApplicationDetailView.as_view(), name="application_detail"),

    path("<int:pk>/etape-1/", views.application_step_personal, name="application_step_personal"),
    path("<int:pk>/etape-2/", views.application_step_contact, name="application_step_contact"),
    path("<int:pk>/etape-3/", views.application_step_professional, name="application_step_professional"),
    path("<int:pk>/etape-4/", views.application_step_documents, name="application_step_documents"),
    path("<int:pk>/revision/", views.application_review, name="application_review"),
    path("<int:pk>/succes/", views.application_success, name="application_success"),
    path("<int:application_pk>/documents/<int:document_pk>/delete/", views.application_document_delete, name="application_document_delete",
),
]

urlpatterns += [
    path("admin/dashboard/", views.DashboardView.as_view(), name="admin_dashboard"),
    path("admin/dossiers/", views.ApplicationListView.as_view(), name="admin_application_list"),
    path("admin/dossiers/<int:pk>/", views.ApplicationDetailView.as_view(), name="admin_application_detail"),
    path("mes-candidatures/", views.MyApplicationsView.as_view(), name="my_applications"),

]