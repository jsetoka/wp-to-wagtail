from django.core.management.base import BaseCommand
from django.db.models import Q

from payment.models import Payment
from payment.momo_services import process_momo_payment_check
from payment.services import MtnMomoError


class Command(BaseCommand):
    help = "Vérifie les paiements MTN MoMo en attente"

    def add_arguments(self, parser):
        parser.add_argument("--payment-id", type=int, help="Vérifier un paiement précis")
        parser.add_argument("--limit", type=int, default=50, help="Nombre max de paiements")

    def handle(self, *args, **options):
        payment_id = options.get("payment_id")
        limit = options.get("limit", 50)

        qs = Payment.objects.filter(
            provider=Payment.PROVIDER_MTN_CG,
            status=Payment.STATUS_PENDING,
        ).exclude(
            Q(provider_reference__isnull=True) | Q(provider_reference="")
        ).order_by("initiated_at")

        if payment_id:
            qs = qs.filter(id=payment_id)

        payments = list(qs[:limit])

        if not payments:
            self.stdout.write(self.style.WARNING("Aucun paiement en attente."))
            return

        self.stdout.write(f"{len(payments)} paiement(s) à vérifier")

        for payment in payments:
            try:
                result = process_momo_payment_check(payment)
                self.stdout.write(
                    self.style.SUCCESS(
                        f"Payment #{payment.id} -> {result['result']} ({result['status']})"
                    )
                )
            except MtnMomoError as e:
                self.stdout.write(
                    self.style.WARNING(f"Payment #{payment.id} -> erreur MoMo: {e}")
                )
            except Exception as e:
                self.stdout.write(
                    self.style.ERROR(f"Payment #{payment.id} -> erreur: {e}")
                )