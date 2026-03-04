from django.db import models
from django.shortcuts import get_object_or_404, redirect
from django.utils import timezone

from modelcluster.fields import ParentalKey

from wagtail.models import Page, Orderable
from wagtail.fields import RichTextField
from wagtail.admin.panels import FieldPanel, InlinePanel
from wagtail.documents.models import Document
from wagtail.snippets.models import register_snippet

from wagtail.contrib.routable_page.models import RoutablePageMixin, route


@register_snippet
class DocumentCategory(models.Model):
    title = models.CharField(max_length=255, unique=True)

    panels = [
        FieldPanel("title"),
    ]

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = "Catégorie de document"
        verbose_name_plural = "Catégories de documents"


class BibliothequePage(RoutablePageMixin, Page):
    """
    Page index qui affiche un tableau de documents.
    Ex: /textes-fondamentaux/
    """
    template = "bibliotheque/bibliotheque_page.html"
    intro = RichTextField(blank=True)

    content_panels = Page.content_panels + [
        FieldPanel("intro"),
        InlinePanel("items", label="Documents"),
    ]

    # Adapte selon ton arborescence
    parent_page_types = ["home.HomePage"]
    subpage_types = []

    @route(r"^download/(?P<item_id>\d+)/$")
    def download(self, request, item_id):
        item = get_object_or_404(self.items, id=item_id)
        if item.document:
            item.download_count += 1
            item.save(update_fields=["download_count"])
            return redirect(item.document.url)
        return redirect(self.url)


class BibliothequeItem(Orderable):
    page = ParentalKey(BibliothequePage, related_name="items", on_delete=models.CASCADE)

    title = models.CharField(max_length=255)
    category = models.ForeignKey(
        DocumentCategory, null=True, blank=True, on_delete=models.SET_NULL, related_name="+"
    )
    document = models.ForeignKey(
        Document, null=True, blank=False, on_delete=models.SET_NULL, related_name="+"
    )

    updated_at = models.DateField(default=timezone.now)
    download_count = models.PositiveIntegerField(default=0)

    panels = [
        FieldPanel("title"),
        FieldPanel("category"),
        FieldPanel("document"),
        FieldPanel("updated_at"),
    ]

    def __str__(self):
        return self.title