from .choices import ApplicationStatus, OICGroup
from .transitions import ALLOWED_TRANSITIONS


STAFF_ROLES = {
    OICGroup.ADMIN,
    OICGroup.REVIEWER,
    OICGroup.SUPERVISOR,
}

MANAGED_ROLES = {
    OICGroup.CANDIDATE,
    OICGroup.ADMIN,
    OICGroup.REVIEWER,
    OICGroup.SUPERVISOR,
}

ROLE_ALLOWED_TRANSITIONS = {
    OICGroup.CANDIDATE: {
        ApplicationStatus.DRAFT: [ApplicationStatus.SUBMITTED],
        ApplicationStatus.SUBMITTED: [],
        ApplicationStatus.INCOMPLETE: [ApplicationStatus.SUBMITTED],
        ApplicationStatus.UNDER_REVIEW: [],
        ApplicationStatus.PENDING_COMMISSION: [],
        ApplicationStatus.APPROVED: [],
        ApplicationStatus.REJECTED: [],
        ApplicationStatus.REGISTERED: [],
    },
    OICGroup.ADMIN: ALLOWED_TRANSITIONS,
    OICGroup.REVIEWER: {
        ApplicationStatus.DRAFT: [],
        ApplicationStatus.SUBMITTED: [
            ApplicationStatus.UNDER_REVIEW,
            ApplicationStatus.INCOMPLETE,
        ],
        ApplicationStatus.INCOMPLETE: [
            ApplicationStatus.SUBMITTED,
        ],
        ApplicationStatus.UNDER_REVIEW: [
            ApplicationStatus.PENDING_COMMISSION,
            ApplicationStatus.REJECTED,
            ApplicationStatus.INCOMPLETE,
        ],
        ApplicationStatus.PENDING_COMMISSION: [],
        ApplicationStatus.APPROVED: [],
        ApplicationStatus.REJECTED: [],
        ApplicationStatus.REGISTERED: [],
    },
    OICGroup.SUPERVISOR: {
        ApplicationStatus.DRAFT: [],
        ApplicationStatus.SUBMITTED: [
            ApplicationStatus.UNDER_REVIEW,
        ],
        ApplicationStatus.INCOMPLETE: [
            ApplicationStatus.SUBMITTED,
            ApplicationStatus.REJECTED,
        ],
        ApplicationStatus.UNDER_REVIEW: [
            ApplicationStatus.PENDING_COMMISSION,
            ApplicationStatus.APPROVED,
            ApplicationStatus.REJECTED,
            ApplicationStatus.INCOMPLETE,
        ],
        ApplicationStatus.PENDING_COMMISSION: [
            ApplicationStatus.APPROVED,
            ApplicationStatus.REJECTED,
        ],
        ApplicationStatus.APPROVED: [
            ApplicationStatus.REGISTERED,
        ],
        ApplicationStatus.REJECTED: [],
        ApplicationStatus.REGISTERED: [],
    },
}


def user_in_group(user, group_name: str) -> bool:
    return bool(user and user.is_authenticated and user.groups.filter(name=group_name).exists())


def get_user_role_names(user) -> list[str]:
    if not user or not user.is_authenticated:
        return []

    return list(
        user.groups.filter(name__in=MANAGED_ROLES).values_list("name", flat=True)
    )


def has_any_role(user, *roles: str) -> bool:
    user_roles = set(get_user_role_names(user))
    return bool(user_roles.intersection(roles))


def is_candidate(user) -> bool:
    return has_any_role(user, OICGroup.CANDIDATE)


def is_oic_admin(user) -> bool:
    return has_any_role(user, OICGroup.ADMIN)


def is_oic_reviewer(user) -> bool:
    return has_any_role(user, OICGroup.REVIEWER)


def is_oic_supervisor(user) -> bool:
    return has_any_role(user, OICGroup.SUPERVISOR)


def is_oic_staff(user) -> bool:
    return has_any_role(user, *STAFF_ROLES)


def is_owner(user, application) -> bool:
    candidate = getattr(application, "candidate", None)
    return bool(user and candidate and getattr(candidate, "user_id", None) == user.id)


def can_view_application(user, application) -> bool:
    return bool(
        user
        and user.is_authenticated
        and (is_oic_staff(user) or is_owner(user, application))
    )


def get_allowed_transitions_for_user(user, application) -> list[str]:
    if not user or not user.is_authenticated:
        return []

    workflow_allowed = set(ALLOWED_TRANSITIONS.get(application.status, []))
    user_roles = get_user_role_names(user)
    allowed = set()

    for role in user_roles:
        if role == OICGroup.CANDIDATE and not is_owner(user, application):
            continue

        allowed.update(
            ROLE_ALLOWED_TRANSITIONS.get(role, {}).get(application.status, [])
        )

    return [status for status in workflow_allowed if status in allowed]


def can_transition_application(user, application, new_status) -> bool:
    return new_status in get_allowed_transitions_for_user(user, application)