# -*- coding: utf-8 -*-

import re
from django.shortcuts import render_to_response
from django.http import HttpResponseRedirect, HttpResponseServerError, HttpResponse, HttpResponseNotFound
from django.template import RequestContext
from deproc.main import forms
from deproc.main import models
from deproc.main import forms
from deproc.main.models import Tariffication, choice_typeh


def add_tariffication(request):
    choices = choice_typeh
    if request.POST:
        print request.POST
        dynamic_form = forms.DynamicForm(choices, request.POST)
    else:
        dynamic_form = forms.DynamicForm(choices)

    for choice in choices:
        if request.POST[choice[0]]:
            hour = choice[0]
        else:
            hour = 0


    form_tariffication = forms.TarifficationModel()
    form_uchplanhour = forms.UchPlanHourModel()

    return render_to_response('tariffication/add.html', locals(), context_instance=RequestContext(request))
