from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin

from .permissions import (
    is_candidate,
    is_oic_admin,
    is_oic_reviewer,
    is_oic_staff,
    is_oic_supervisor,
)


class CandidateRequiredMixin(LoginRequiredMixin, UserPassesTestMixin):
    def test_func(self):
        return is_candidate(self.request.user)


class OICAdminRequiredMixin(LoginRequiredMixin, UserPassesTestMixin):
    def test_func(self):
        return is_oic_admin(self.request.user)


class OICReviewerRequiredMixin(LoginRequiredMixin, UserPassesTestMixin):
    def test_func(self):
        return is_oic_reviewer(self.request.user)


class OICSupervisorRequiredMixin(LoginRequiredMixin, UserPassesTestMixin):
    def test_func(self):
        return is_oic_supervisor(self.request.user)


class OICStaffRequiredMixin(LoginRequiredMixin, UserPassesTestMixin):
    def test_func(self):
        return is_oic_staff(self.request.user)


class StaffRequiredMixin(OICStaffRequiredMixin):
    pass