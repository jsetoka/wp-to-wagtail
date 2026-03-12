# adhesions/models.py

import uuid
from django.conf import settings
from django.db import models
from django.utils import timezone
from .choices import (
    ApplicationType,
    ApplicationStatus,
    DocumentType,
    DocumentStatus,
)


def application_document_upload_to(instance, filename):
    ext = filename.split(".")[-1].lower()
    return f"applications/{instance.application.reference}/{instance.document_type}/{uuid.uuid4().hex}.{ext}"


class TimeStampedModel(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True



class MembershipRole(models.TextChoices):
    CANDIDATE = "CANDIDATE", "Candidat"
    ADMIN = "ADMIN", "OIC Admin"
    REVIEWER = "REVIEWER", "OIC Reviewer"
    SUPERVISOR = "SUPERVISOR", "OIC Supervisor"


class MembershipProfile(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name="membership_profile")
    role = models.CharField(max_length=20, choices=MembershipRole.choices)
    is_active_for_membership = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.user} - {self.get_role_display()}"



class CandidateProfile(TimeStampedModel):
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL,
        on_delete=models.CASCADE,
        related_name="candidate_profile",
        null=True,
        blank=True,
    )
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    date_of_birth = models.DateField(null=True, blank=True)
    place_of_birth = models.CharField(max_length=255, blank=True)
    gender = models.CharField(max_length=20, blank=True)
    nationality = models.CharField(max_length=100, blank=True)
    phone = models.CharField(max_length=50)
    email = models.EmailField()
    address = models.TextField(blank=True)
    city = models.CharField(max_length=150, blank=True)
    country = models.CharField(max_length=150, blank=True)

    def __str__(self):
        return f"{self.last_name} {self.first_name}"




GENDER_CHOICES = [
    ("M", "Masculin"),
    ("F", "Féminin"),
]
class Application(TimeStampedModel):
    reference = models.CharField(max_length=30, unique=True, editable=False)
    candidate = models.ForeignKey(
        CandidateProfile,
        on_delete=models.CASCADE,
        related_name="applications"
    )
    application_type = models.CharField(
        max_length=30,
        choices=ApplicationType.choices,
        default=ApplicationType.NATIONAL,
    )
    status = models.CharField(
        max_length=30,
        choices=ApplicationStatus.choices,
        default=ApplicationStatus.DRAFT,
    )

    # infos personnelles
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    date_of_birth = models.DateField(null=True, blank=True)
    place_of_birth = models.CharField(max_length=255, blank=True)
    gender = models.CharField(
        max_length=1,
        choices=GENDER_CHOICES,
        verbose_name="Genre"
    )
    nationality = models.CharField(max_length=100, blank=True)

    # coordonnées
    phone = models.CharField(max_length=50)
    email = models.EmailField()
    address = models.TextField(blank=True)

    # infos pro
    profession = models.CharField(max_length=255, blank=True)
    specialization = models.CharField(max_length=255, blank=True)
    employer = models.CharField(max_length=255, blank=True)
    professional_address = models.TextField(blank=True)
    biography = models.TextField(blank=True)

    # gestion
    submitted_at = models.DateTimeField(null=True, blank=True)
    reviewed_at = models.DateTimeField(null=True, blank=True)
    assigned_to = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        related_name="assigned_applications",
        null=True,
        blank=True,
    )
    internal_comment = models.TextField(blank=True)

    class Meta:
        ordering = ["-created_at"]

    def __str__(self):
        return f"{self.reference} - {self.last_name} {self.first_name}"

    def save(self, *args, **kwargs):
        if not self.reference:
            self.reference = self.generate_reference()
        super().save(*args, **kwargs)

    def generate_reference(self):
        year = timezone.now().year
        count = Application.objects.filter(created_at__year=year).count() + 1
        return f"OIC-{year}-{count:05d}"

    @property
    def is_submittable(self):
        required_docs = self.get_required_document_types()
        current_docs = set(self.documents.values_list("document_type", flat=True))
        return all(doc in current_docs for doc in required_docs)

    def get_required_document_types(self):
        if self.application_type == ApplicationType.NATIONAL:
            return [
                DocumentType.PHOTO,
                DocumentType.ID_CARD,
                DocumentType.DIPLOMA,
                DocumentType.NATIONALITY_CERTIFICATE,
                DocumentType.CRIMINAL_RECORD,
            ]
        if self.application_type == ApplicationType.FOREIGNER:
            return [
                DocumentType.PHOTO,
                DocumentType.PASSPORT,
                DocumentType.DIPLOMA,
                DocumentType.CRIMINAL_RECORD,
            ]
        if self.application_type == ApplicationType.COMPANY:
            return [
                DocumentType.OTHER,
            ]
        return []


class ApplicationDocument(TimeStampedModel):
    application = models.ForeignKey(
        Application,
        on_delete=models.CASCADE,
        related_name="documents"
    )
    document_type = models.CharField(max_length=50, choices=DocumentType.choices)
    file = models.FileField(upload_to=application_document_upload_to)
    original_filename = models.CharField(max_length=255, blank=True)
    status = models.CharField(
        max_length=20,
        choices=DocumentStatus.choices,
        default=DocumentStatus.PENDING
    )
    rejection_reason = models.TextField(blank=True)
    checked_by = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="checked_documents"
    )
    checked_at = models.DateTimeField(null=True, blank=True)

    class Meta:
        unique_together = ("application", "document_type")

    def __str__(self):
        return f"{self.application.reference} - {self.document_type}"


class ApplicationStatusHistory(TimeStampedModel):
    application = models.ForeignKey(
        Application,
        on_delete=models.CASCADE,
        related_name="status_history"
    )
    old_status = models.CharField(max_length=30, choices=ApplicationStatus.choices, blank=True)
    new_status = models.CharField(max_length=30, choices=ApplicationStatus.choices)
    comment = models.TextField(blank=True)
    changed_by = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="application_status_changes"
    )

    class Meta:
        ordering = ["-created_at"]


class ApplicationComment(TimeStampedModel):
    application = models.ForeignKey(
        Application,
        on_delete=models.CASCADE,
        related_name="comments"
    )
    author = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        on_delete=models.SET_NULL,
        null=True,
        blank=True
    )
    is_internal = models.BooleanField(default=True)
    message = models.TextField()

    class Meta:
        ordering = ["-created_at"]