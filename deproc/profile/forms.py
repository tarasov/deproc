# -*- coding: utf-8 -*-

from django import forms
from django.contrib.admin.sites import site
from django.core.exceptions import ValidationError
from django.forms import ModelForm
from django.forms.extras.widgets import SelectDateWidget
from django.forms.widgets import Select
from django.contrib.admin import widgets as admin_widgets
from deproc.tariffication import models
from deproc.tariffication.models import Teachers, Students


class StudentForm(ModelForm):
    class Meta:
        model = models.Students

class TeacherForm(ModelForm):
    class Meta:
        model = models.Teachers


class StudentsForm(forms.Form):
    error_css_class = 'error'
    required_css_class = 'required'

    GENDER_CHOICES = (
        ('M', 'мужчина',),
        ('W', 'женщина',)
        )

    username = forms.CharField(max_length = 30, label=u"Логин")
    email = forms.CharField(max_length = 30, required=False, label=u"Почта")
    pass1 = forms.CharField(widget = forms.PasswordInput, label = u"Пароль", min_length = 3, max_length = 30)
    pass2 = forms.CharField(widget = forms.PasswordInput, label = u"Пароль ещё раз")
    last_name = forms.CharField(max_length=30, label=u"Фамилия")
    first_name = forms.CharField(max_length=30, label=u"Имя")
    other_name = forms.CharField(label=u"Отчество")
    b_day = forms.DateField(label=u"День рождения", widget=SelectDateWidget)
    phone = forms.CharField(label=u"Телефон")
    sex = forms.ChoiceField(label=u"Пол", widget=forms.Select, choices=GENDER_CHOICES)
    cart = forms.IntegerField(label=u"Номер студенческого")
    is_elder = forms.BooleanField(label=u"Староста", widget=forms.NullBooleanSelect, required=False)

    def clean_pass2(self):
        if (self.cleaned_data["pass2"] != self.cleaned_data.get("pass1", "")):
            raise forms.ValidationError(u"Пароли не совпадают")
        return self.cleaned_data["pass2"]


