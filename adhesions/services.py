# adhesions/services.py

from django.utils import timezone
from .choices import DocumentStatus


def validate_document(document, user, is_valid=True, reason=""):
    document.status = DocumentStatus.VALID if is_valid else DocumentStatus.INVALID
    document.rejection_reason = "" if is_valid else reason
    document.checked_by = user
    document.checked_at = timezone.now()
    document.save()
    return document


from django.contrib.auth.models import Group

from .choices import OICGroup


def assign_user_to_oic_group(user, group_name: str):
    group = Group.objects.get(name=group_name)
    user.groups.add(group)
    return user


def set_candidate_role(user):
    return assign_user_to_oic_group(user, OICGroup.CANDIDATE)


def set_admin_role(user):
    return assign_user_to_oic_group(user, OICGroup.ADMIN)


def set_reviewer_role(user):
    return assign_user_to_oic_group(user, OICGroup.REVIEWER)


def set_supervisor_role(user):
    return assign_user_to_oic_group(user, OICGroup.SUPERVISOR)