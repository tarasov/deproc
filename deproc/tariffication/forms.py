# -*- coding: utf-8 -*-

from django import forms
from django.contrib.admin.sites import site
from django.core.exceptions import ValidationError
from django.forms import ModelForm
from django.forms.widgets import Select
from django.contrib.admin import widgets as admin_widgets
from deproc.tariffication import models
from deproc.tariffication.models import Teachers

attrs_dict = { 'class': 'required' }
class TarifficationModel(ModelForm):
    class Meta:
        model = models.Tariffication
        fields = ('teacher', 'group_plan', )


class UchPlanHourModel(ModelForm):
    class Meta:
        model = models.UchPlanHour
        fields = ('uch_plan', )


class DynamicForm(forms.Form):
    def __init__(self, choices, *args, **kwargs):
        super(DynamicForm, self).__init__(*args, **kwargs)
        choices = models.TypeHour.objects.all()
        for i, choice in enumerate(choices):
            label = choice.name
            self.fields['%s' % choice.id] = forms.CharField(label=label, required=False, widget=forms.TextInput(attrs={"placeholder": u"0 часов"}))


class PlanGroupForm(ModelForm):
    class Meta:
        model = models.Groups_plan
