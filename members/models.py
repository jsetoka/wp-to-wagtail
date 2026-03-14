from decimal import Decimal
from django.db import models

from payment.models import Payment
from wagtail.models import Page, Orderable
from wagtail.admin.panels import FieldPanel, InlinePanel
from wagtail.snippets.models import register_snippet
from wagtail.images import get_image_model_string
from modelcluster.fields import ParentalKey
from modelcluster.models import ClusterableModel
import uuid

from django.conf import settings
from django.db.models import Sum


@register_snippet
class OrgSection(models.Model):
    """Ex: Bureau exécutif, Conseil, Commission..."""
    title = models.CharField(max_length=120, unique=True)

    panels = [FieldPanel("title")]

    def __str__(self):
        return self.title


@register_snippet
class Member(models.Model):
    """Une personne (réutilisable dans plusieurs pages/sections si besoin)."""
    role = models.CharField(max_length=120)  # Ex: Président
    name = models.CharField(max_length=160)
    subtitle = models.CharField(max_length=255, blank=True)  # Ex: Président chambre de ...
    photo = models.ForeignKey(
        get_image_model_string(),
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
    )

    panels = [
        FieldPanel("role"),
        FieldPanel("name"),
        FieldPanel("subtitle"),
        FieldPanel("photo"),
    ]

    def __str__(self):
        return f"{self.role} — {self.name}"


class OrgChartPage(Page):
    intro = models.TextField(blank=True)

    content_panels = Page.content_panels + [
        FieldPanel("intro"),
        InlinePanel("sections", label="Sections"),
    ]


class OrgChartSection(Orderable, ClusterableModel):
    """Une section placée sur une page, avec son ordre."""
    page = ParentalKey(OrgChartPage, on_delete=models.CASCADE, related_name="sections")
    section = models.ForeignKey(OrgSection, on_delete=models.PROTECT, related_name="+")

    panels = [
        FieldPanel("section"),
        InlinePanel("members", label="Membres de cette section"),
    ]

    def __str__(self):
        return self.section.title


class OrgChartSectionMember(Orderable):
    """Un membre dans une section (ordre + sélection du Member)."""
    parent = ParentalKey(OrgChartSection, on_delete=models.CASCADE, related_name="members")
    member = models.ForeignKey(Member, on_delete=models.PROTECT, related_name="+")

    panels = [FieldPanel("member")]

    def __str__(self):
        return str(self.member)
    


# members/models.py

class MemberProfile(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name="member_profile")
    member_no = models.CharField(max_length=30, unique=True)
    is_active_member = models.BooleanField(default=True)

    @staticmethod
    def generate_member_no():
        last_member = MemberProfile.objects.order_by("-id").first()

        if not last_member:
            return "OIC-000001"

        last_number = int(last_member.member_no.split("-")[1])
        return f"OIC-{last_number + 1:06d}"

    def __str__(self):
        return f"{self.member_no} - {self.user.get_full_name() or self.user.username}"
    

# members/models.py
class AnnualFee(models.Model):
    year = models.PositiveIntegerField(unique=True)
    amount = models.DecimalField(max_digits=12, decimal_places=2)
    currency = models.CharField(max_length=10, default="XAF")
    is_open = models.BooleanField(default=True)  # autoriser paiement

    def __str__(self):
        return f"Cotisation {self.year} - {self.amount} {self.currency}"
    

# members/models.py
class MemberAnnualDues(models.Model):
    STATUS_DUE = "due"
    STATUS_PARTIAL = "partial"
    STATUS_PAID = "paid"
    STATUS_CHOICES = [
        (STATUS_DUE, "À payer"),
        (STATUS_PARTIAL, "Partiel"),
        (STATUS_PAID, "Payé"),
    ]

    member = models.ForeignKey(MemberProfile, on_delete=models.CASCADE, related_name="dues")
    fee = models.ForeignKey(AnnualFee, on_delete=models.PROTECT, related_name="member_dues")

    created_at = models.DateTimeField(auto_now_add=True)
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default=STATUS_DUE)

    # Option : figer le montant au moment de la création (au cas où amount change)
    amount_due = models.DecimalField(max_digits=12, decimal_places=2)

    class Meta:
        unique_together = [("member", "fee")]

    def __str__(self):
        return f"{self.member} - {self.fee.year}"

    @property
    def amount_paid(self):
        agg = self.payments.filter(status=Payment.STATUS_CONFIRMED).aggregate(s=models.Sum("amount"))
        return agg["s"] or 0

    @property
    def balance(self):
        return max(self.amount_due - self.amount_paid, 0)

    def refresh_status(self):
        paid = self.amount_paid
        if paid <= 0:
            self.status = self.STATUS_DUE
        elif paid < self.amount_due:
            self.status = self.STATUS_PARTIAL
        else:
            self.status = self.STATUS_PAID
        self.save(update_fields=["status"])

    @property
    def progress_percent(self):
        if not self.amount_due or self.amount_due <= 0:
            return 0
        paid = Decimal(str(self.amount_paid))
        pct = int((paid / self.amount_due) * 100)
        return max(0, min(pct, 100))


from wagtail.snippets.models import register_snippet
from wagtail.admin.panels import FieldPanel, InlinePanel
from modelcluster.models import ClusterableModel
from modelcluster.fields import ParentalKey
from wagtail.models import Orderable

@register_snippet
class UserMenuFragment(ClusterableModel):
    """
    Fragment de menu pour l'espace utilisateur (dropdown auth).
    On peut en avoir plusieurs (par ex: "default", "premium", etc.)
    """
    name = models.CharField(max_length=50, unique=True, default="default")

    panels = [
        FieldPanel("name"),
        InlinePanel("items", label="Liens"),
    ]

    def __str__(self):
        return f"User menu fragment: {self.name}"


class UserMenuFragmentItem(Orderable):
    fragment = ParentalKey(UserMenuFragment, on_delete=models.CASCADE, related_name="items")

    label = models.CharField(max_length=80)
    url = models.CharField(max_length=255)

    # options d'affichage
    only_staff = models.BooleanField(default=False, help_text="Visible uniquement pour staff/admin")
    open_in_new_tab = models.BooleanField(default=False)

    panels = [
        FieldPanel("label"),
        FieldPanel("url"),
        FieldPanel("only_staff"),
        FieldPanel("open_in_new_tab"),
    ]

    def __str__(self):
        return self.label