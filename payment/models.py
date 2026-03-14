from django.db import models
from django.utils import timezone

class Payment(models.Model):
    STATUS_INITIATED = "initiated"
    STATUS_PENDING = "pending"
    STATUS_CONFIRMED = "confirmed"
    STATUS_FAILED = "failed"
    STATUS_CANCELLED = "cancelled"

    STATUS_CHOICES = [
        (STATUS_INITIATED, "Initié"),
        (STATUS_PENDING, "En attente"),
        (STATUS_CONFIRMED, "Confirmé"),
        (STATUS_FAILED, "Échoué"),
        (STATUS_CANCELLED, "Annulé"),
    ]

    METHOD_CASH = "cash"
    METHOD_BANK = "bank"
    METHOD_MOBILE = "mobile"
    METHOD_CARD = "card"
    METHOD_CHOICES = [
        (METHOD_CASH, "Espèces"),
        (METHOD_BANK, "Virement bancaire"),
        (METHOD_MOBILE, "Mobile money"),
        (METHOD_CARD, "Carte"),
    ]

    PROVIDER_MTN_CG = "mtn_cg"
    PROVIDER_CHOICES = [
        (PROVIDER_MTN_CG, "MTN Congo"),
    ]

    id = models.BigAutoField(primary_key=True)
    dues = models.ForeignKey("members.MemberAnnualDues", on_delete=models.CASCADE, related_name="payments")

    amount = models.DecimalField(max_digits=12, decimal_places=2)
    method = models.CharField(max_length=10, choices=METHOD_CHOICES)
    status = models.CharField(max_length=12, choices=STATUS_CHOICES, default=STATUS_INITIATED)

    provider = models.CharField(max_length=20, choices=PROVIDER_CHOICES, blank=True)
    payer_phone = models.CharField(max_length=30, blank=True)

    reference = models.CharField(max_length=80, blank=True)          # ref externe lisible
    provider_reference = models.CharField(max_length=120, blank=True, db_index=True)
    external_id = models.CharField(max_length=80, blank=True)
    provider_status = models.CharField(max_length=80, blank=True)    # SUCCESSFUL / PENDING / FAILED...
    provider_payload = models.JSONField(default=dict, blank=True)

    note = models.TextField(blank=True)

    initiated_at = models.DateTimeField(auto_now_add=True)
    confirmed_at = models.DateTimeField(null=True, blank=True)
    failed_at = models.DateTimeField(null=True, blank=True)

    def mark_pending(self, payload=None):
        self.status = self.STATUS_PENDING
        if payload is not None:
            self.provider_payload = payload
        self.save(update_fields=["status", "provider_payload"])

    def confirm(self, payload=None):
        self.status = self.STATUS_CONFIRMED
        self.confirmed_at = timezone.now()
        if payload is not None:
            self.provider_payload = payload
        self.save(update_fields=["status", "confirmed_at", "provider_payload"])
        self.dues.refresh_status()

    def fail(self, payload=None, provider_status=None):
        self.status = self.STATUS_FAILED
        self.failed_at = timezone.now()
        if payload is not None:
            self.provider_payload = payload
        if provider_status:
            self.provider_status = provider_status
            self.save(update_fields=["status", "failed_at", "provider_payload", "provider_status"])
        else:
            self.save(update_fields=["status", "failed_at", "provider_payload"])


class MomoAccessToken(models.Model):
    provider = models.CharField(max_length=50)
    api_user = models.CharField(max_length=255)
    target_env = models.CharField(max_length=50, default="sandbox")
    access_token = models.TextField()
    expires_at = models.DateTimeField()
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.provider} - {self.api_user}"