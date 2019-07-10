from django import template

register = template.Library()


@register.filter
def ispk(data):
    try:
        if int(data) != 0:
            return True
    except (TypeError, ValueError):
        pass
    return False