# -*- coding: utf-8 -*-
from django import forms
from deproc import settings

class CalendarWidget(forms.TextInput):

    class Media:
        js = ('/admin/jsi18n/',
              settings.STATIC_URL + 'admin/' + 'js/core.js',
              settings.STATIC_URL + 'admin/' + "js/calendar.js",
              settings.STATIC_URL + 'admin/' + "js/admin/DateTimeShortcuts.js")
        css = {
            'all': (
                settings.STATIC_URL + 'admin/' +'css/forms.css',
                #settings.ADMIN_MEDIA_PREFIX + 'css/base.css',
                settings.STATIC_URL + 'admin/' +'css/widgets.css',)
        }

    def __init__(self, attrs={}):
        super(CalendarWidget, self).__init__(attrs={'class': 'vDateField', 'size': '10'})
