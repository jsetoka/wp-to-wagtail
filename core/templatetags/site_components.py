from django import template
from core.models import Menu, FooterText
from members.models import UserMenuFragment

register = template.Library()


@register.simple_tag
def get_menu(name="main"):
    return Menu.objects.filter(name=name).first()


@register.simple_tag(takes_context=True)
def get_menu_items(context, name="main"):
    menu = Menu.objects.filter(name=name).first()
    request = context.get("request")

    if not menu:
        return []

    def is_visible(visibility):
        if visibility == "all":
            return True
        if visibility == "auth":
            return bool(request and request.user.is_authenticated)
        if visibility == "anon":
            return bool(request and not request.user.is_authenticated)
        return True

    items = []

    for item in menu.items.all():
        visibility = getattr(item, "visibility", "all")

        if not is_visible(visibility):
            continue

        page = getattr(item, "link_page", None)
        url = page.url if page else getattr(item, "link_url", "")

        children = []
        if hasattr(item, "children"):
            for child in item.children.all():
                child_page = getattr(child, "link_page", None)
                children.append({
                    "title": getattr(child, "title", ""),
                    "link_page": child_page,
                    "link_url": getattr(child, "link_url", ""),
                    "url": child_page.url if child_page else getattr(child, "link_url", ""),
                })

        items.append({
            "title": getattr(item, "title", ""),
            "link_page": page,
            "link_url": getattr(item, "link_url", ""),
            "url": url,
            "show_children": getattr(item, "show_children", True),
            "visibility": visibility,
            "children": children,
        })

    return items


@register.inclusion_tag("components/footer.html", takes_context=True)
def footer_text(context, title="default"):
    footer = FooterText.objects.filter(title=title).first()
    return {"footer": footer}


@register.simple_tag
def get_user_menu_fragment(name="default"):
    return UserMenuFragment.objects.filter(name=name).first()