from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.core.exceptions import PermissionDenied, ValidationError
from django.db.models import Q, Count
from django.shortcuts import get_object_or_404, redirect, render
from django.views import View


from .choices import ApplicationStatus
from .forms import (
    ApplicationDocumentForm,
    ApplicationStartForm,
    AssignReviewerForm,
    ContactInfoForm,
    PersonalInfoForm,
    ProfessionalInfoForm,
)
from .mixins import CandidateRequiredMixin, OICStaffRequiredMixin, StaffRequiredMixin
from .models import Application, ApplicationDocument, CandidateProfile
from .permissions import (
    can_view_application,
    get_allowed_transitions_for_user,
    is_oic_admin,
    is_oic_reviewer,
    is_oic_staff,
    is_oic_supervisor,
    is_owner,
)
from .workflows import transition_application


ACTIVE_APPLICATION_STATUSES = [
    ApplicationStatus.DRAFT,
    ApplicationStatus.INCOMPLETE,
    ApplicationStatus.SUBMITTED,
    ApplicationStatus.UNDER_REVIEW,
    ApplicationStatus.PENDING_COMMISSION,
]


@login_required
def application_start(request):
    if request.method == "POST":
        form = ApplicationStartForm(request.POST)
        if form.is_valid():
            profile, _created = CandidateProfile.objects.get_or_create(user=request.user)

            application_type = form.cleaned_data["application_type"]

            existing_application = Application.objects.filter(
                candidate=profile,
                application_type=application_type,
                status__in=ACTIVE_APPLICATION_STATUSES,
            ).order_by("-created_at").first()

            if existing_application:
                messages.warning(
                    request,
                    "Vous avez déjà une demande en cours pour ce type d’adhésion."
                )
                return redirect(
                    "adhesions:application_step_personal",
                    pk=existing_application.pk,
                )

            application = Application.objects.create(
                candidate=profile,
                application_type=application_type,
            )

            messages.success(request, "Votre nouveau dossier a été créé.")
            return redirect("adhesions:application_step_personal", pk=application.pk)
    else:
        form = ApplicationStartForm()

    return render(request, "adhesions/start.html", {"form": form, "step": 1})


@login_required
def application_step_personal(request, pk):
    application = get_object_or_404(
        Application,
        pk=pk,
        candidate__user=request.user,
    )



    if request.method == "POST":

        form = PersonalInfoForm(request.POST, instance=application)

        if form.is_valid():
            application = form.save()


    if request.method == "POST":
        form = PersonalInfoForm(request.POST, instance=application)



        if form.is_valid():
            application = form.save()

            candidate_profile = get_object_or_404(
                CandidateProfile,
                user=request.user,
            )

            candidate_profile.last_name = application.last_name
            candidate_profile.first_name = application.first_name
            candidate_profile.gender = application.gender
            candidate_profile.date_of_birth = application.date_of_birth
            candidate_profile.place_of_birth = application.place_of_birth
            candidate_profile.nationality = application.nationality

            candidate_profile.save()

            return redirect("adhesions:application_step_contact", pk=application.pk)
    else:
        form = PersonalInfoForm(instance=application)

    return render(
        request,
        "adhesions/step_personal.html",
        {
            "form": form,
            "application": application,
            "step": 2,
        },
    )


@login_required
def application_step_contact(request, pk):
    application = get_object_or_404(
        Application,
        pk=pk,
        candidate__user=request.user,
    )

    if request.method == "POST":
        form = ContactInfoForm(request.POST, instance=application)
        if form.is_valid():
            application = form.save()

            candidate_profile = get_object_or_404(
                CandidateProfile,
                user=request.user,
            )
            candidate_profile.address = application.address
            candidate_profile.phone = application.phone
            candidate_profile.email = application.email
            candidate_profile.save()
            return redirect("adhesions:application_step_professional", pk=application.pk)
    else:
        form = ContactInfoForm(instance=application)

    return render(
        request,
        "adhesions/step_contact.html",
        {
            "form": form,
            "application": application,
            "step": 3,
        },
    )


@login_required
def application_step_professional(request, pk):
    application = get_object_or_404(
        Application,
        pk=pk,
        candidate__user=request.user,
    )

    if request.method == "POST":
        form = ProfessionalInfoForm(request.POST, instance=application)
        if form.is_valid():
            form.save()
            return redirect("adhesions:application_step_documents", pk=application.pk)
    else:
        form = ProfessionalInfoForm(instance=application)

    return render(
        request,
        "adhesions/step_professional.html",
        {
            "form": form,
            "application": application,
            "step": 4,
        },
    )


@login_required
def application_step_documents(request, pk):
    application = get_object_or_404(
        Application,
        pk=pk,
        candidate__user=request.user,
    )

    documents = application.documents.all()

    uploaded_document_types = set(
        application.documents.values_list("document_type", flat=True)
    )

    if request.method == "POST":
        form = ApplicationDocumentForm(request.POST, request.FILES)

        if form.is_valid():
            ApplicationDocument.objects.update_or_create(
                application=application,
                document_type=form.cleaned_data["document_type"],
                defaults={
                    "file": form.cleaned_data["file"],
                    "original_filename": form.cleaned_data["file"].name,
                },
            )

            messages.success(request, "Document enregistré.")
            return redirect("adhesions:application_step_documents", pk=application.pk)

    else:
        form = ApplicationDocumentForm()

    return render(
        request,
        "adhesions/step_documents.html",
        {
            "form": form,
            "application": application,
            "documents": documents,
            "required_documents": application.get_required_document_types(),
            "uploaded_document_types": uploaded_document_types,
            "step": 5,

            # ✅ AJOUT ICI
            "can_delete_documents": application.status in [
                ApplicationStatus.DRAFT,
                ApplicationStatus.INCOMPLETE,
            ],
        },
    )


@login_required
def application_review(request, pk):
    application = get_object_or_404(
        Application,
        pk=pk,
        candidate__user=request.user,
    )

    documents = application.documents.all()

    if request.method == "POST":
        if application.status == ApplicationStatus.SUBMITTED:
            messages.info(request, "Cette candidature a déjà été soumise.")
            return redirect("adhesions:application_success", pk=application.pk)

        try:
            transition_application(
                application,
                ApplicationStatus.SUBMITTED,
                changed_by=request.user,
                comment="Soumission du dossier par le candidat.",
            )
        except ValidationError as e:
            messages.error(request, e.messages[0])
            return redirect("adhesions:application_review", pk=application.pk)

        messages.success(request, "Votre candidature a été soumise avec succès.")
        return redirect("adhesions:application_success", pk=application.pk)

    return render(
        request,
        "adhesions/review.html",
        {
            "application": application,
            "documents": documents,
            "step": 6,
        },
    )


@login_required
def application_success(request, pk):
    application = get_object_or_404(
        Application,
        pk=pk,
        candidate__user=request.user,
    )
    return render(
        request,
        "adhesions/success.html",
        {"application": application},
    )


@login_required
def application_document_delete(request, application_pk, document_pk):
    application = get_object_or_404(Application, pk=application_pk)

    if not can_view_application(request.user, application):
        messages.error(request, "Vous n’avez pas accès à ce dossier.")
        return redirect("adhesions:application_review", application.pk)

    document = get_object_or_404(
        ApplicationDocument,
        pk=document_pk,
        application=application,
    )

    can_delete = False

    if is_oic_staff(request.user):
        can_delete = True
    elif is_owner(request.user, application) and application.status in [
        ApplicationStatus.DRAFT,
        ApplicationStatus.INCOMPLETE,
    ]:
        can_delete = True

    if not can_delete:
        messages.error(request, "Vous ne pouvez pas supprimer ce document à cette étape.")
        return redirect("adhesions:application_step_documents", application.pk)

    if request.method == "POST":
        if document.file:
            document.file.delete(save=False)
        document.delete()
        messages.success(request, "Le document a été supprimé.")

    return redirect("adhesions:application_step_documents", application.pk)

from adhesions.models import Application
from adhesions.choices import ApplicationStatus

class DashboardView(StaffRequiredMixin, View):
    template_name = "adhesions/dashboard.html"

    def get(self, request):
        counts_by_status = dict(
            Application.objects
            .values_list("status")
            .annotate(total=Count("id"))
        )

        stats = {
            "total": sum(counts_by_status.values()),
            "draft": counts_by_status.get(ApplicationStatus.DRAFT.value, 0),
            "submitted": counts_by_status.get(ApplicationStatus.SUBMITTED.value, 0),
            "incomplete": counts_by_status.get(ApplicationStatus.INCOMPLETE.value, 0),
            "under_review": counts_by_status.get(ApplicationStatus.UNDER_REVIEW.value, 0),
            "pending_commission": counts_by_status.get(ApplicationStatus.PENDING_COMMISSION.value, 0),
            "approved": counts_by_status.get(ApplicationStatus.APPROVED.value, 0),
            "rejected": counts_by_status.get(ApplicationStatus.REJECTED.value, 0),
        }

        from django.urls import reverse
        dashboard_cards = [
            {
                "title": "Total dossiers",
                "value": stats["total"],
                "description": "Toutes les candidatures",
                "icon": "📁",
                "icon_class": "bg-light text-dark",
                "url": reverse("adhesions:admin_application_list"),
            },
            {
                "title": "Brouillons",
                "value": stats["draft"],
                "description": "Dossiers non soumis",
                "icon": "✍️",
                "icon_class": "bg-light text-dark",
                "url": f'{reverse("adhesions:admin_application_list")}?status={ApplicationStatus.DRAFT}',
            },
            {
                "title": "Soumis",
                "value": stats["submitted"],
                "description": "En attente de traitement",
                "icon": "📨",
                "icon_class": "bg-primary-subtle text-primary",
                "url": f'{reverse("adhesions:admin_application_list")}?status={ApplicationStatus.SUBMITTED}',
            },
            {
                "title": "Incomplets",
                "value": stats["incomplete"],
                "description": "À compléter",
                "icon": "🧾",
                "icon_class": "bg-info-subtle text-info",
                "url": f'{reverse("adhesions:admin_application_list")}?status={ApplicationStatus.INCOMPLETE}',
            },
            {
                "title": "En vérification",
                "value": stats["under_review"],
                "description": "Analyse administrative",
                "icon": "🔎",
                "icon_class": "bg-warning-subtle text-warning",
                "url": f'{reverse("adhesions:admin_application_list")}?status={ApplicationStatus.UNDER_REVIEW}',
            },
            {
                "title": "En commission",
                "value": stats["pending_commission"],
                "description": "Soumis à décision",
                "icon": "🏛️",
                "icon_class": "bg-warning-subtle text-warning",
                "url": f'{reverse("adhesions:admin_application_list")}?status={ApplicationStatus.PENDING_COMMISSION}',
            },
            {
                "title": "Approuvés",
                "value": stats["approved"],
                "description": "Dossiers validés",
                "icon": "✅",
                "icon_class": "bg-success-subtle text-success",
                "url": f'{reverse("adhesions:admin_application_list")}?status={ApplicationStatus.APPROVED}',
            },
            {
                "title": "Rejetés",
                "value": stats["rejected"],
                "description": "Dossiers refusés",
                "icon": "⛔",
                "icon_class": "bg-danger-subtle text-danger",
                "url": f'{reverse("adhesions:admin_application_list")}?status={ApplicationStatus.REJECTED}',
            },
        ]

        latest = (
            Application.objects
            .select_related("candidate", "assigned_to")
            .order_by("-id")[:10]
        )

        return render(
            request,
            self.template_name,
            {
                "stats": stats,
                "dashboard_cards": dashboard_cards,
                "latest": latest,
            },
        )



class ApplicationListView(OICStaffRequiredMixin, View):
    template_name = "adhesions/application_list.html"

    def get(self, request):
        qs = Application.objects.select_related("candidate", "assigned_to").all()

        if is_oic_reviewer(request.user) and not is_oic_admin(request.user) and not is_oic_supervisor(request.user):
            qs = qs.filter(Q(assigned_to=request.user) | Q(assigned_to__isnull=True))

        status = request.GET.get("status")
        app_type = request.GET.get("type")
        q = request.GET.get("q")

        if status:
            qs = qs.filter(status=status)

        if app_type:
            qs = qs.filter(application_type=app_type)

        if q:
            qs = qs.filter(
                Q(reference__icontains=q)
                | Q(last_name__icontains=q)
                | Q(first_name__icontains=q)
                | Q(email__icontains=q)
            )

        return render(request, self.template_name, {"applications": qs})


class ApplicationDetailView(OICStaffRequiredMixin, View):
    template_name = "adhesions/application_detail.html"

    def get(self, request, pk):
        application = get_object_or_404(
            Application.objects.select_related("candidate", "assigned_to"),
            pk=pk,
        )

        if not can_view_application(request.user, application):
            raise PermissionDenied

        allowed_transitions = get_allowed_transitions_for_user(request.user, application)

        if hasattr(application, "status_history"):
            history = application.status_history.select_related("changed_by").order_by("-id")
        else:
            history = application.applicationstatushistory_set.select_related("changed_by").order_by("-id")


        assign_form = AssignReviewerForm(
            initial={"assigned_to": application.assigned_to}
        )
        return render(
            request,
            self.template_name,
            {
                "application": application,
                "allowed_transitions": allowed_transitions,
                "assign_form": assign_form,
                "history": history,
            },
        )

    def post(self, request, pk):
        application = get_object_or_404(Application, pk=pk)

        if not can_view_application(request.user, application):
            raise PermissionDenied

        new_status = request.POST.get("new_status")
        comment = request.POST.get("comment", "")

        try:
            transition_application(
                application=application,
                new_status=new_status,
                changed_by=request.user,
                comment=comment,
            )
            messages.success(request, "Statut mis à jour.")
        except ValidationError as e:
            messages.error(
                request,
                e.messages[0] if hasattr(e, "messages") and e.messages else str(e),
            )

        return redirect("adhesions:admin_application_detail", pk=application.pk)




class MyApplicationsView(CandidateRequiredMixin, View):
    template_name = "adhesions/my_applications.html"

    def get(self, request):
        profile = CandidateProfile.objects.filter(user=request.user).first()

        applications = Application.objects.none()
        if profile:
            applications = (
                Application.objects.filter(candidate=profile)
                .select_related("candidate", "assigned_to")
                .order_by("-id")
            )

        return render(
            request,
            self.template_name,
            {
                "applications": applications,
                "candidate_profile": profile,
            },
        )
    
@login_required
def admin_application_assign(request, pk):
    if not request.user.is_staff:
        raise PermissionDenied

    application = get_object_or_404(Application, pk=pk)

    if request.method != "POST":
        return redirect("adhesions:admin_application_detail", pk=application.pk)

    form = AssignReviewerForm(request.POST)

    if form.is_valid():
        reviewer = form.cleaned_data["assigned_to"]
        application.assigned_to = reviewer
        application.save(update_fields=["assigned_to"])

        if reviewer:
            messages.success(request, f"Dossier assigné à {reviewer}.")
        else:
            messages.success(request, "Assignation retirée.")

    else:
        messages.error(request, "Impossible d’enregistrer l’assignation.")

    return redirect("adhesions:admin_application_detail", pk=application.pk)