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
from main.models import Tariffication, choice_typeh

def wellcome(request):
    choices = choice_typeh
    userforms = forms.UserForm()
    bad_models = ['message', u'сайт', u'сессия']
    appmodels = get_models()

    tariffs = Tariffication.objects.all()
    # узнаем семестры
    semestres = []
    for tariff in tariffs:
        if tariff.uch_plan_hour.uch_plan.semestr not in semestres:
            semestres.append(tariff.uch_plan_hour.uch_plan.semestr)
    # делаем цикл по семестрам для фильтрации тариффикации
    table = tr = ()
    for semestr in semestres:
        tariffs = Tariffication.objects.filter(uch_plan_hour__uch_plan__semestr = semestr)
        tariff = tariffs[0]
        hours = [(tariff.uch_plan_hour.type, tariff.uch_plan_hour.count_hours) for tariff in tariffs]
        teacher = tariff.set_teacher.username
        grp = tariff.group_plan.group
        disc = tariff.uch_plan_hour.uch_plan.disc
        smtr = tariff.uch_plan_hour.uch_plan.semestr
        tr += (teacher,grp,disc,smtr),
        for typeh in choice_typeh:
            for i, hour in enumerate(hours):
                # записываем часы
                if typeh[0] == hour[0][0]:
                    choice_type = (typeh[0], hour[1]),
                    break
                else:
                    # тут записываем 0
                    if i == len(hours)-1:
                        choice_type = (typeh[0], 0),
            tr = (tr[len(tr)-1] + choice_type, )
        table += tr
    return render_to_response('tariffication/index.html', locals(), context_instance=RequestContext(request))
#WE ARE
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
