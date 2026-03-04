from django.db import models

from wagtail.models import Page, Orderable
from wagtail.admin.panels import FieldPanel, InlinePanel
from wagtail.snippets.models import register_snippet
from wagtail.images import get_image_model_string
from modelcluster.fields import ParentalKey
from modelcluster.models import ClusterableModel


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