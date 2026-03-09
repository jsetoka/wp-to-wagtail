from django.contrib.auth.models import Group
from django.core.management.base import BaseCommand

from adhesions.choices import OICGroup


class Command(BaseCommand):
    help = "Crée les groupes OIC pour le module adhésions"

    def handle(self, *args, **options):
        for group_name, _label in OICGroup.choices:
            Group.objects.get_or_create(name=group_name)
            self.stdout.write(self.style.SUCCESS(f"Groupe prêt: {group_name}"))