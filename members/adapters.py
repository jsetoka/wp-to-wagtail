from allauth.account.adapter import DefaultAccountAdapter
from django.contrib.auth.models import Group


class CustomAccountAdapter(DefaultAccountAdapter):

    def save_user(self, request, user, form, commit=True):
        user = super().save_user(request, user, form, commit)

        group, _ = Group.objects.get_or_create(name="OIC_CANDIDATE")
        user.groups.add(group)

        return user