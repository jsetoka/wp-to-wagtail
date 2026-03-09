from .choices import ApplicationStatus


ALLOWED_TRANSITIONS = {
    ApplicationStatus.DRAFT: [
        ApplicationStatus.SUBMITTED,
    ],
    ApplicationStatus.SUBMITTED: [
        ApplicationStatus.UNDER_REVIEW,
        ApplicationStatus.INCOMPLETE,
        ApplicationStatus.REJECTED,
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
}