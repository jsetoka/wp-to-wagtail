from django.core.exceptions import ValidationError
from django.utils import timezone

from .choices import ApplicationStatus
from .models import ApplicationStatusHistory
from .permissions import can_transition_application
from .transitions import ALLOWED_TRANSITIONS


def transition_application(application, new_status, changed_by=None, comment=""):
    old_status = application.status

    if old_status == new_status:
        raise ValidationError(
            f"Le dossier est déjà au statut {new_status}."
        )

    allowed = ALLOWED_TRANSITIONS.get(old_status, [])

    if new_status not in allowed:
        raise ValidationError(
            f"Transition interdite: {old_status} -> {new_status}"
        )

    if changed_by and not can_transition_application(changed_by, application, new_status):
        raise ValidationError(
            "Vous n’avez pas les droits nécessaires pour effectuer cette transition."
        )

    application.status = new_status

    if new_status == ApplicationStatus.SUBMITTED and not application.submitted_at:
        application.submitted_at = timezone.now()

    if new_status in [
        ApplicationStatus.UNDER_REVIEW,
        ApplicationStatus.APPROVED,
        ApplicationStatus.REJECTED,
    ]:
        application.reviewed_at = timezone.now()

    application.save()

    ApplicationStatusHistory.objects.create(
        application=application,
        old_status=old_status,
        new_status=new_status,
        comment=comment,
        changed_by=changed_by,
    )

    return application