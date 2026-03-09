from django.apps import apps
from django.core.management.base import BaseCommand
from django.db import transaction


EXCLUDED_MODELS = {
    "contenttypes.ContentType",
    "auth.Permission",
    "admin.LogEntry",
}

# Ordre manuel pour limiter les soucis de dépendances.
# Tu peux l'ajuster selon ton projet.
MODEL_ORDER = [
    "sites.Site",
    "auth.Group",
    "auth.User",
    "account.EmailAddress",
    "socialaccount.SocialApp",
    "socialaccount.SocialAccount",
    "socialaccount.SocialToken",
    "wagtailcore.Locale",
    "wagtailcore.Site",
    "wagtailcore.Page",
    "wagtailimages.Image",
    "wagtaildocs.Document",
    "taggit.Tag",
    "members.Member",
    "members.Payment",
]


class Command(BaseCommand):
    help = "Copie les données de sqlite_old vers default (PostgreSQL)"

    def add_arguments(self, parser):
        parser.add_argument(
            "--skip-existing",
            action="store_true",
            help="Ignore les objets déjà présents",
        )

    def handle(self, *args, **options):
        skip_existing = options["skip_existing"]

        all_models = list(apps.get_models())

        ordered_models = []
        remaining = []

        labels = {f"{m._meta.app_label}.{m.__name__}": m for m in all_models}

        for label in MODEL_ORDER:
            model = labels.get(label)
            if model:
                ordered_models.append(model)

        for model in all_models:
            label = f"{model._meta.app_label}.{model.__name__}"
            if label not in MODEL_ORDER:
                remaining.append(model)

        models_to_copy = ordered_models + remaining

        for model in models_to_copy:
            label = f"{model._meta.app_label}.{model.__name__}"

            if label in EXCLUDED_MODELS:
                self.stdout.write(self.style.WARNING(f"Skip excluded: {label}"))
                continue

            if model._meta.proxy:
                self.stdout.write(self.style.WARNING(f"Skip proxy: {label}"))
                continue

            if not model._meta.managed:
                self.stdout.write(self.style.WARNING(f"Skip unmanaged: {label}"))
                continue

            self.stdout.write(self.style.NOTICE(f"Copying {label}..."))

            source_qs = model.objects.using("sqlite_old").all()

            count = 0
            failed = 0

            for obj in source_qs.iterator():
                m2m_data = {}
                for m2m_field in model._meta.many_to_many:
                    try:
                        m2m_data[m2m_field.name] = list(
                            getattr(obj, m2m_field.name).using("sqlite_old").all().values_list("pk", flat=True)
                        )
                    except Exception:
                        m2m_data[m2m_field.name] = []

                pk_name = model._meta.pk.attname
                pk_value = getattr(obj, pk_name)

                if skip_existing:
                    if model.objects.using("default").filter(pk=pk_value).exists():
                        continue

                obj.pk = pk_value

                try:
                    with transaction.atomic(using="default"):
                        obj.save(using="default", force_insert=True)

                        for m2m_field in model._meta.many_to_many:
                            rel_pks = m2m_data.get(m2m_field.name, [])
                            if rel_pks:
                                getattr(obj, m2m_field.name).using("default").set(rel_pks)

                    count += 1
                except Exception as e:
                    failed += 1
                    self.stdout.write(
                        self.style.ERROR(f"Failed {label} pk={pk_value}: {e}")
                    )

            self.stdout.write(
                self.style.SUCCESS(f"Done {label}: copied={count}, failed={failed}")
            )

        self.stdout.write(self.style.SUCCESS("Copy finished."))