# -*- coding: utf-8 -*-
from django.template.base import Library
from deproc import settings
from django.utils.safestring import mark_safe


register = Library()

@register.filter(needs_autoescape=True)
def add_icon(value, arg, autoescape=False):
    media_url = settings.MEDIA_URL
    icon = '<a href="/%s/%s"><img src="%simg/%s.png"/></a>'

    if value == 'info':
        # иконка информации
        return mark_safe(icon % (arg, 'info', media_url, 'info'))

    if value == 'edit':
    # иконка информации
        return mark_safe(icon % (arg, 'edit', media_url, 'edit'))


    if value == 'delete':
    # иконка информации
        return mark_safe(icon % (arg, 'delete', media_url, 'delete'))
