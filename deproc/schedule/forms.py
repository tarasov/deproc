from django.forms import ModelForm
from django import forms
from django.utils.safestring import mark_safe
from django.utils.translation import ugettext
from deproc import settings
from deproc.schedule import models
from django.contrib.admin import widgets


#class CalendarForm(forms.Form):
#    calendar = forms.DateField(widget=widgets.AdminDateWidget)

#
#class CalendarForm(forms.ModelForm):
#    mydate = forms.DateField(widget=widgets.AdminDateWidget)
#    mytime = forms.TimeField(widget=widgets.AdminTimeWidget)
#    mydatetime = forms.DateTimeField(widget=widgets.AdminSplitDateTime)
#
#    class Meta:
#        model = models.Schedule_day
#
#class EventSplitDateTime(forms.SplitDateTimeWidget):
#    def __init__(self, attrs=None):
#        widgets = [forms.TextInput(attrs={'class': 'vDateField'}),
#                   forms.TextInput(attrs={'class': 'vTimeField'})]
#        forms.MultiWidget.__init__(self, widgets, attrs)
#
#    def format_output(self, rendered_widgets):
#        return mark_safe(u'%s<br />%s' % (rendered_widgets[0], rendered_widgets[1]))
#
#class EventForm(forms.Form):
#    start = forms.DateTimeField(label=ugettext("Start"), widget=EventSplitDateTime())
#    end = forms.DateTimeField(label=ugettext("End"), widget=EventSplitDateTime())

#
#class CalendarWidget(forms.TextInput):
#    class Media:
#        js = ('/admin/jsi18n/',
#              settings.ADMIN_MEDIA_PREFIX + 'js/core.js',
#              settings.ADMIN_MEDIA_PREFIX + "js/calendar.js",
#              settings.ADMIN_MEDIA_PREFIX + "js/admin/DateTimeShortcuts.js")
#        css = {
#            'all': (
#                settings.ADMIN_MEDIA_PREFIX + 'css/forms.css',
#                settings.ADMIN_MEDIA_PREFIX + 'css/base.css',
#                settings.ADMIN_MEDIA_PREFIX + 'css/widgets.css',)
#        }
#
#    def __init__(self, attrs={}):
#        super(CalendarWidget, self).__init__(attrs={'class': 'vDateField', 'size': '10'})