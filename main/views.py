# -*- coding: utf-8 -*-
import logging
import re
from django.shortcuts import render_to_response
from django.http import HttpResponseRedirect, HttpResponseServerError, HttpResponse, HttpResponseNotFound
from django.template import RequestContext
from django.core.urlresolvers import reverse
from main import forms
from main import models
from django.db.models import get_models
from main.forms import DeForm
from main.models import Tariffication

def wellcome(request):
    userforms = forms.UserForm()
    bad_models = ['message', u'сайт', u'сессия']
    appmodels = get_models()

    tariffs = Tariffication.objects.all()
    teacher = Tariffication.set_teacher
    grp = Tariffication.group_plan.group
    disc = Tariffication.uch_plan_hour.uch_plan.disc



#        <td align="center">{{ forloop.counter }}</td>
#        <td align="left"><a href="">{{ tariff.uch_plan_hour.uch_plan.pk }}<b></b></a></td>
#        <td align="left"><a href="">{{ tariff.set_teacher }}<b></b></a></td>
#        <td align="left"><a href=""><b>{{ tariff.group_plan.group }}</b></a></td>
#        <td align="left"><a href=""><b>{{ tariff.uch_plan_hour.uch_plan.disc }}</b></a></td>
#        <td align="left"><a href=""><b>{{ tariff.uch_plan_hour.type }}</b></a></td>
#        <td align="left"><a href=""><b>{{ tariff.uch_plan_hour.count_hours}}</b></a></td>

    return render_to_response('tariffication/index.html', locals(), context_instance=RequestContext(request))

def tarification(request):
    form = forms.TarificationForm()
    return render_to_response('tariffication/tariffication.html', locals(), context_instance=RequestContext(request))

def action(request, app):

    appmodels = get_models()

    for appmodel in appmodels:
        if appmodel.__name__.lower() == app:
            app = appmodel._meta.verbose_name
            app1 = appmodel.__name__
            model_app = appmodel
#    print model_app
    class Meta:
        model = model_app

    DeForm.Meta = Meta()
    print DeForm.Meta.model
    form = DeForm()
    print form
#    form = getattr(forms, '%sForm' % app1)

    return render_to_response('tariffication/action.html', locals(), context_instance=RequestContext(request))
