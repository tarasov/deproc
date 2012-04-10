from django.forms import ModelForm
from django import forms
from deproc.schedule.widgets import CalendarWidget

class MyCalendarForm(forms.Form):
    day = forms.DateField(widget=CalendarWidget())