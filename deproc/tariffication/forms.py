# -*- coding: utf-8 -*-

from django import forms
from django.contrib.admin.sites import site
from django.core.exceptions import ValidationError
from django.forms import ModelForm
from django.forms.widgets import Select
from django.contrib.admin import widgets as admin_widgets
from deproc.tariffication import models
from deproc.tariffication.models import Profile

attrs_dict = { 'class': 'required' }
class TarifficationModel(ModelForm):
    def __init__(self, *args, **kwargs):
        super(TarifficationModel, self).__init__(*args, **kwargs)
        self.fields['teacher'].choices = [('', '----------')] + Profile().get_teachers()

    teacher = forms.ChoiceField(choices=(), widget=forms.Select(attrs=attrs_dict), label = 'Преподователь')
    class Meta:
        model = models.Tariffication
        fields = ('teacher', 'group_plan', )
        widgets = {
            'group_plan' : admin_widgets.RelatedFieldWidgetWrapper(Select(), model.group_plan.field.rel, site, can_add_related=True)
        }

class UchPlanHourModel(ModelForm):
    class Meta:
        model = models.UchPlanHour
        fields = ('uch_plan', )


class DynamicForm(forms.Form):
    def __init__(self, choices, *args, **kwargs):
        super(DynamicForm, self).__init__(*args, **kwargs)
        for i, choice in enumerate(choices):
            label = choice[1]
            self.fields['%s' % choice[0]] = forms.CharField(label=label, required=False, widget=forms.TextInput(attrs={"placeholder": u"0 часов"}))

class PlanGroupForm(ModelForm):
    class Meta:
        model = models.Groups_plan