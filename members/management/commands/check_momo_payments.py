from django.core.management.base import BaseCommand
from members.models import Payment
from members.services import MtnMomoClient


class Command(BaseCommand):
    help = "Vérifie les paiements MTN MoMo en attente"

    def handle(self, *args, **options):

        client = MtnMomoClient()

        payments = Payment.objects.filter(
            provider=Payment.PROVIDER_MTN_CG,
            status=Payment.STATUS_PENDING,
        )

        self.stdout.write(f"{payments.count()} paiements à vérifier")

        for payment in payments:

            if not payment.provider_reference:
                continue

            try:

                data = client.get_request_status(payment.provider_reference)

                momo_status = data.get("status", "")

                payment.provider_status = momo_status
                payment.provider_payload = data

                if momo_status == "SUCCESSFUL":
                    payment.status = Payment.STATUS_CONFIRMED
                    payment.save(
                        update_fields=[
                            "provider_status",
                            "provider_payload",
                            "status",
                        ]
                    )

                    # mettre à jour la cotisation
                    payment.dues.refresh_status()

                    self.stdout.write(
                        self.style.SUCCESS(
                            f"Paiement {payment.id} confirmé"
                        )
                    )

                elif momo_status in {"FAILED", "REJECTED", "TIMEOUT"}:
                    payment.status = Payment.STATUS_FAILED
                    payment.save(
                        update_fields=[
                            "provider_status",
                            "provider_payload",
                            "status",
                        ]
                    )

                    self.stdout.write(
                        self.style.WARNING(
                            f"Paiement {payment.id} échoué"
                        )
                    )

                else:
                    payment.save(
                        update_fields=[
                            "provider_status",
                            "provider_payload",
                        ]
                    )

            except Exception as e:
                self.stdout.write(
                    self.style.ERROR(
                        f"Erreur paiement {payment.id}: {e}"
                    )
                )