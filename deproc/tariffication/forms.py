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


class UchPlanModel(ModelForm):
    class Meta:
        model = models.UchPlanHour
        fields = ('uch_plan', )


class DynamicForm(forms.Form):
    def __init__(self, hours = None, *args, **kwargs):
        super(DynamicForm, self).__init__(*args, **kwargs)
        typehours = models.TypeHour.objects.all()
        for i, typehour in enumerate(typehours):
            if typehours:
                try:
                    hour = hours.get(uch_plan_hour__type_hour=typehour)
                    self.__get_field(typehour, i, hour)
                except Exception:
                    self.__get_field(typehour, i)
            else:
                self.__get_field(typehour, i)


    def __get_field(self, typehour, i, hours = None):
        label = typehour.name
        if hours:
            self.fields['%s' % typehour.short_name] = forms.CharField(
                    label=label,
                    required=False,
                    initial = hours.count_hours,
                    widget=forms.TextInput(attrs={"placeholder": u"0 часов"})
            )
        else:
            self.fields['%s' % typehour.short_name] = forms.CharField(
                    label=label,
                    required=False,
                    widget=forms.TextInput(attrs={"placeholder": u"0 часов"})
            )


class PlanGroupForm(ModelForm):
    class Meta:
        model = models.Groups_plan
