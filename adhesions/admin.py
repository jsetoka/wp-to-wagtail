# adhesions/admin.py

from django.contrib import admin
from .models import (
    CandidateProfile,
    Application,
    ApplicationDocument,
    ApplicationStatusHistory,
    ApplicationComment,
)


class ApplicationDocumentInline(admin.TabularInline):
    model = ApplicationDocument
    extra = 0


class ApplicationStatusHistoryInline(admin.TabularInline):
    model = ApplicationStatusHistory
    extra = 0
    readonly_fields = ("old_status", "new_status", "comment", "changed_by", "created_at")


@admin.register(Application)
class ApplicationAdmin(admin.ModelAdmin):
    list_display = (
        "reference",
        "last_name",
        "first_name",
        "application_type",
        "status",
        "submitted_at",
        "assigned_to",
    )
    list_filter = ("application_type", "status", "created_at", "submitted_at")
    search_fields = ("reference", "last_name", "first_name", "email", "phone")
    readonly_fields = ("reference", "created_at", "updated_at", "submitted_at", "reviewed_at")
    inlines = [ApplicationDocumentInline, ApplicationStatusHistoryInline]


@admin.register(CandidateProfile)
class CandidateProfileAdmin(admin.ModelAdmin):
    list_display = ("last_name", "first_name", "email", "phone")
    search_fields = ("last_name", "first_name", "email", "phone")
    class Meta:
        verbose_name = "Candidat"
        verbose_name_plural = "Candidats"

@admin.register(ApplicationDocument)
class ApplicationDocumentAdmin(admin.ModelAdmin):
    list_display = ("application", "document_type", "status", "checked_by", "checked_at")
    list_filter = ("document_type", "status")


@admin.register(ApplicationComment)
class ApplicationCommentAdmin(admin.ModelAdmin):
    list_display = ("application", "author", "is_internal", "created_at")


@admin.register(ApplicationStatusHistory)
class ApplicationStatusHistoryAdmin(admin.ModelAdmin):
    list_display = ("application", "old_status", "new_status", "changed_by", "created_at")