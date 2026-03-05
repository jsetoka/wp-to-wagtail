from django.db import models

from wagtail.admin.panels import FieldPanel, InlinePanel, MultiFieldPanel, PageChooserPanel
from wagtail.snippets.models import register_snippet
from modelcluster.models import ClusterableModel
from modelcluster.fields import ParentalKey
from wagtail.models import Page, Orderable
from wagtail.contrib.settings.models import BaseSiteSetting, register_setting
from wagtail.fields import StreamField, RichTextField
from wagtail import blocks
from wagtail.images.blocks import ImageChooserBlock
from wagtail.images.models import Image

LINK_HELP = "Laisse vide si tu choisis une page interne."



class HomePage(Page):
    """
    HomePage inspirée de la structure observée sur oic.cg :
    - Slider / hero
    - Editorial (devise + texte)
    - Listing d’articles récents
    - Mise en avant "Un ingénieur, un impact"
    - Bloc "Regards d’ingénieurs"
    - Cartes vers Documentation / Actualité / Tableau de l’Ordre
    """

    # HERO / Editorial
    tagline = models.CharField(
        max_length=255,
        blank=True,
        help_text="Ex: « L’ingénieur au cœur du développement du Congo »"
    )

    editorial_title = models.CharField(max_length=255, blank=True, default="Editorial")
    editorial_body = RichTextField(blank=True)

    # Articles récents
    show_latest_articles = models.BooleanField(default=True)
    latest_articles_title = models.CharField(max_length=255, blank=True, default="Articles")
    latest_articles_count = models.PositiveSmallIntegerField(default=5)

    # "Un ingénieur, un impact" (mise en avant d’une page Personne/Ingénieur)
    spotlight_title = models.CharField(max_length=255, blank=True, default="Un ingénieur, un impact")
    spotlight_page = models.ForeignKey(
        "wagtailcore.Page",
        null=True, blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        help_text="Choisir une page profil/ingénieur à mettre en avant."
    )

    # "Regards d’ingénieurs" (mise en avant d’une page rubrique)
    perspectives_title = models.CharField(max_length=255, blank=True, default="Regards d’ingénieurs")
    perspectives_page = models.ForeignKey(
        "wagtailcore.Page",
        null=True, blank=True,
        on_delete=models.SET_NULL,
        related_name="+",
        help_text="Choisir la page rubrique 'Regards d’ingénieurs' (ou équivalent)."
    )
    perspectives_excerpt = models.TextField(blank=True)

    content_panels = Page.content_panels + [
        MultiFieldPanel(
            [
                InlinePanel("hero_slides", label="Slides", min_num=1),
            ],
            heading="Hero / Slider",
        ),

        MultiFieldPanel(
            [
                FieldPanel("tagline"),
                FieldPanel("editorial_title"),
                FieldPanel("editorial_body"),
            ],
            heading="Editorial",
        ),

        MultiFieldPanel(
            [
                FieldPanel("show_latest_articles"),
                FieldPanel("latest_articles_title"),
                FieldPanel("latest_articles_count"),
            ],
            heading="Articles (liste automatique)",
        ),

        MultiFieldPanel(
            [
                FieldPanel("spotlight_title"),
                PageChooserPanel("spotlight_page"),
            ],
            heading="Mise en avant : Un ingénieur, un impact",
        ),

        MultiFieldPanel(
            [
                FieldPanel("perspectives_title"),
                PageChooserPanel("perspectives_page"),
                FieldPanel("perspectives_excerpt"),
            ],
            heading="Rubrique : Regards d’ingénieurs",
        ),

        MultiFieldPanel(
            [
                InlinePanel("quick_links", label="Cartes", min_num=3, max_num=3),
            ],
            heading="Cartes (Documentation / Actualité / Tableau...)",
        ),
    ]

    template = "home/home_page.html"
    def get_context(self, request, *args, **kwargs):
        context = super().get_context(request, *args, **kwargs)

        from blog.models import BlogPage, BlogIndexPage

        blog_index = BlogIndexPage.objects.live().public().first()

        qs = BlogPage.objects.live().public().order_by("-date", "-first_published_at")

        if blog_index:
            qs = qs.descendant_of(blog_index)

        context["latest_articles"] = qs[: self.latest_articles_count]
        context["featured_articles"] = qs.filter(featured=True)[:3]

        return context

class HomeHeroSlide(Orderable):
    page = ParentalKey(HomePage, on_delete=models.CASCADE, related_name="hero_slides")

    title = models.CharField(max_length=255, blank=True)
    subtitle = models.TextField(blank=True)

    image = models.ForeignKey(
        "wagtailimages.Image",
        null=True, blank=True,
        on_delete=models.SET_NULL,
        related_name="+"
    )

    cta_text = models.CharField(max_length=50, blank=True, default="En savoir plus")
    cta_page = models.ForeignKey(
        "wagtailcore.Page",
        null=True, blank=True,
        on_delete=models.SET_NULL,
        related_name="+"
    )

    panels = [
        FieldPanel("title"),
        FieldPanel("subtitle"),
        FieldPanel("image"),
        FieldPanel("cta_text"),
        PageChooserPanel("cta_page"),
    ]


class HomeQuickLink(Orderable):
    page = ParentalKey(HomePage, on_delete=models.CASCADE, related_name="quick_links")

    title = models.CharField(max_length=80)
    text = models.TextField(blank=True)

    image = models.ForeignKey(
        "wagtailimages.Image",
        null=True, blank=True,
        on_delete=models.SET_NULL,
        related_name="+"
    )

    link_page = models.ForeignKey(
        "wagtailcore.Page",
        null=True, blank=True,
        on_delete=models.SET_NULL,
        related_name="+"
    )

    panels = [
        FieldPanel("title"),
        FieldPanel("text"),
        FieldPanel("image"),
        PageChooserPanel("link_page"),
    ]

    def get_context(self, request, *args, **kwargs):
        context = super().get_context(request, *args, **kwargs)

        from blog.models import BlogPage, BlogIndexPage

        # 1) Trouver le BlogIndexPage (si tu en as un)
        blog_index = BlogIndexPage.objects.live().public().first()

        # 2) QuerySet d’articles
        qs = BlogPage.objects.live().public().order_by("-date", "-first_published_at")

        # 3) Si un index existe, on limite aux articles sous cet index
        if blog_index:
            qs = qs.descendant_of(blog_index)

        # 4) On fournit au template
        context["latest_articles"] = qs[: self.latest_articles_count]

        # Optionnel : mettre aussi les featured pour un bandeau
        context["featured_articles"] = qs.filter(featured=True)[:3]

        return context


class StandardPage(Page):
    hero_image = models.ForeignKey(
        "wagtailimages.Image",
        null=True, blank=True,
        on_delete=models.SET_NULL,
        related_name="+"
    )
    hero_alt = models.CharField(max_length=160, blank=True)
    show_toc = models.BooleanField(
        default=True, help_text="Afficher le sommaire automatique (H2)")

    intro = RichTextField(blank=True)
    body = StreamField(
        [
            ("paragraphe", blocks.RichTextBlock(features=[
             "h2", "bold", "italic", "link", "ol", "ul"])),
            ("image", ImageChooserBlock()),
        ],
        use_json_field=True,
        blank=True,
    )

    content_panels = Page.content_panels + [
        MultiFieldPanel([
            FieldPanel("hero_image"),
            FieldPanel("hero_alt"),
            FieldPanel("show_toc"),
        ], heading="En-tête (Hero)"),
        FieldPanel("intro"),
        FieldPanel("body"),
    ]


@register_snippet
class FooterText(models.Model):
    title = models.CharField(max_length=255)
    body = models.TextField(blank=True)

    panels = [
        FieldPanel("title"),
        FieldPanel("body"),
    ]

    def __str__(self):
        return self.title


@register_snippet
class Menu(ClusterableModel):
    name = models.CharField(max_length=50, unique=True)

    panels = [
        FieldPanel("name"),
        InlinePanel("items", label="Éléments du menu"),
    ]

    def __str__(self):
        return self.name


class LinkFields(models.Model):
    title = models.CharField(max_length=100)
    link_page = models.ForeignKey(
        Page, null=True, blank=True, on_delete=models.SET_NULL, related_name="+"
    )
    link_url = models.CharField(
        max_length=255, blank=True, help_text=LINK_HELP)

    class Meta:
        abstract = True

    @property
    def url(self):
        return self.link_page.url if self.link_page else self.link_url


class MenuItem(Orderable, ClusterableModel, LinkFields):
    menu = ParentalKey(Menu, on_delete=models.CASCADE, related_name="items")

    show_children = models.BooleanField(default=True)

    VISIBILITY_CHOICES = [
        ("all", "Toujours visible"),
        ("auth", "Visible si connecté"),
        ("anon", "Visible si non connecté"),
    ]
    visibility = models.CharField(
        max_length=10,
        choices=VISIBILITY_CHOICES,
        default="all",
        help_text="Contrôle l'affichage selon l'état de connexion",
    )

    panels = [
        FieldPanel("title"),
        FieldPanel("link_page"),
        FieldPanel("link_url"),
        FieldPanel("show_children"),
        FieldPanel("visibility"),
        InlinePanel("children", label="Sous-liens"),
    ]


class SubMenuItem(Orderable, LinkFields):
    # parent: le MenuItem (qui doit être ClusterableModel)
    parent = ParentalKey(MenuItem, on_delete=models.CASCADE,
                         related_name="children")

    panels = [
        FieldPanel("title"),
        FieldPanel("link_page"),
        FieldPanel("link_url"),
    ]

    def __str__(self):
        return self.title
    
    
class LinkBlock(blocks.StructBlock):
    label = blocks.CharBlock(required=True, help_text="Texte du lien")
    page = blocks.PageChooserBlock(
        required=False, help_text="Lien vers une page interne")
    url = blocks.URLBlock(required=False, help_text="…ou URL externe")

    class Meta:
        icon = "link"
        label = "Lien"


class SocialBlock(blocks.StructBlock):
    label = blocks.CharBlock(
        required=True, help_text="Nom du réseau (Facebook, X/Twitter, LinkedIn…)")
    icon_class = blocks.CharBlock(
        required=False, help_text="Classe Bootstrap Icons (ex: bi bi-facebook)")
    url = blocks.URLBlock(required=True)

    class Meta:
        icon = "site"
        label = "Réseau social"


@register_setting
class FooterSettings(BaseSiteSetting):
    # Colonne 1
    about_title = models.CharField(max_length=100, default="À propos")
    about_text = RichTextField(features=["bold", "italic", "link", "h2", "h3", "h4", "h5", "h6", "left", "center", "right", "justify"], blank=True, default=(
        "Kerenes est un projet collaboratif visant à valoriser les talents et l’innovation au Congo."
    ))

    # Colonne 2
    links_title = models.CharField(max_length=100, default="Liens utiles")
    links = StreamField(
        [("link", LinkBlock())],
        use_json_field=True, blank=True, default=[]
    )

    # Colonne 3
    social_title = models.CharField(max_length=100, default="Suivez-nous")
    socials = StreamField(
        [("social", SocialBlock())],
        use_json_field=True, blank=True, default=[]
    )

    # Style (classes utilitaires Bootstrap/Tailwind selon ton stack)
    footer_bg_class = models.CharField(
        max_length=100, default="bg-navy",
        help_text="Classe CSS de fond (ex: bg-navy ou bg-dark)"
    )
    footer_text_class = models.CharField(
        max_length=100, default="text-light",
        help_text="Classe CSS du texte (ex: text-light)"
    )

    panels = [
        MultiFieldPanel([
            FieldPanel("about_title"),
            FieldPanel("about_text"),
        ], heading="Colonne 1 : À propos"),
        MultiFieldPanel([
            FieldPanel("links_title"),
            FieldPanel("links"),
        ], heading="Colonne 2 : Liens utiles"),
        MultiFieldPanel([
            FieldPanel("social_title"),
            FieldPanel("socials"),
        ], heading="Colonne 3 : Réseaux sociaux"),
        MultiFieldPanel([
            FieldPanel("footer_bg_class"),
            FieldPanel("footer_text_class"),
        ], heading="Style"),
    ]

    class Meta:
        verbose_name = "Footer (paramètres du site)"