from django import template
from home.models import Menu, FooterText

register = template.Library()

@register.simple_tag
def get_menu(name="main"):
    menu = Menu.objects.filter(name=name).first()
    return menu

@register.simple_tag
def get_menu_items(name="main"):
    menu = Menu.objects.filter(name=name).first()
    return menu.items.all() if menu else []


@register.inclusion_tag("components/footer.html", takes_context=True)
def footer_text(context, title="default"):
    footer = FooterText.objects.filter(title=title).first()
    return {"footer": footer}