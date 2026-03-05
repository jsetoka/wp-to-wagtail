from django import template
from members.models import UserMenuFragment

register = template.Library()

@register.simple_tag
def get_user_menu_fragment(name="default"):
    return UserMenuFragment.objects.filter(name=name).first()