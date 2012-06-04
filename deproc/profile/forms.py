# -*- coding: utf-8 -*-

from django import forms
from django.contrib.admin.sites import site
from django.core.exceptions import ValidationError
from django.forms import ModelForm
from django.forms.widgets import Select
from django.contrib.admin import widgets as admin_widgets
from deproc.tariffication import models
from deproc.tariffication.models import Teachers


class StudentForm(ModelForm):
    class Meta:
        model = models.Students

class TeacherForm(ModelForm):
    class Meta:
        model = models.Teachers
