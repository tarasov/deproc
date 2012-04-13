# -*- coding: utf-8 -*-

from django import forms
from django.core.exceptions import ValidationError
from django.forms import ModelForm, widgets
from deproc.main import models
from deproc.main.models import Profile

attrs_dict = { 'class': 'required' }
class TarifficationModel(ModelForm):
    def __init__(self, *args, **kwargs):
        super(TarifficationModel, self).__init__(*args, **kwargs)
        self.fields['teacher'].choices = [('', '----------')] + Profile().get_teachers()

    teacher = forms.ChoiceField(choices=(), widget=forms.Select(attrs=attrs_dict), label = 'Преподователь')

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
        for i, choice in enumerate(choices):
            label = choice[1]
            self.fields['%s' % choice[0]] = forms.CharField(label=label, required=False, widget=forms.TextInput(attrs={"placeholder": u"0 часов"}))


#class DynForm(forms.Form):
#    """
#    Dynamic form that allows the user to change and then verify the data that was parsed
#    """
#    def setFields(self, kwds):
#        """
#        Set the fields in the form
#        """
#        keys = kwds.keys()
#        keys.sort()
#        for k in keys:
#            self.fields[k] = forms.IntegerField(label=kwds[k],  widget=forms.TextInput(attrs={"placeholder": u"0 часов"}))
#
#    def setData(self, kwds):
#        """
#        Set the data to include in the form
#        """
#        keys = kwds.keys()
#        keys.sort()
#        for k in keys:
#            self.data[k] = kwds[k]
#
#    def validate(self, post):
#        """
#        Validate the contents of the form
#        """
#        for name,field in self.fields.items():
#            try:
#                field.clean(post[name])
#            except ValidationError, e:
#                self.errors[name] = e.messages
