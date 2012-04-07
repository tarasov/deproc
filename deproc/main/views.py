# -*- coding: utf-8 -*-
import logging
import re
from django.shortcuts import render_to_response
from django.http import HttpResponseRedirect, HttpResponseServerError, HttpResponse, HttpResponseNotFound
from django.template import RequestContext
from django.core.urlresolvers import reverse
from deproc.main import forms
from deproc.main import models
from django.db.models import get_models
from deproc.main.forms import DeForm
from deproc.main.models import Tariffication, choice_typeh
from django.db.models import Count


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
    table = ()
    for semestr in semestres:
#        tariffs = Tariffication.objects.values('group_plan__group__name').annotate(count = Count('group_plan__group')).filter(uch_plan_hour__uch_plan__semestr = semestr)
        tariffs_values = Tariffication.objects.values('group_plan__group', 'teacher', 'uch_plan_hour__uch_plan__semestr').annotate(count = Count('group_plan__group')).filter(uch_plan_hour__uch_plan__semestr = semestr)
        tr = tds = ()
        for value in tariffs_values:
#            print value
            tariffs = Tariffication.objects.filter(uch_plan_hour__uch_plan__semestr = value['uch_plan_hour__uch_plan__semestr'], teacher = value['teacher'], group_plan__group = value['group_plan__group'])
#            print tariff
#            tariff = tariffs[0]
            tariff = tariffs[0]
            hours = [(t.uch_plan_hour.type, t.uch_plan_hour.count_hours) for t in tariffs]
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
#

def tariffication(request):
    tariffs = Tariffication.objects.all()
    # узнаем семестры
    semestres = []
    for tariff in tariffs:
        if tariff.uch_plan_hour.uch_plan.semestr not in semestres:
            semestres.append(tariff.uch_plan_hour.uch_plan.semestr)
        # делаем цикл по семестрам для фильтрации тариффикации
    table = ()
    for semestr in semestres:
        tariffs_values = Tariffication.objects.values('group_plan__group', 'teacher', 'uch_plan_hour__uch_plan__semestr').annotate(count = Count('group_plan__group')).filter(uch_plan_hour__uch_plan__semestr = semestr)
        tr = tds = ()
        for value in tariffs_values:
            tariffs = Tariffication.objects.filter(uch_plan_hour__uch_plan__semestr = value['uch_plan_hour__uch_plan__semestr'], teacher = value['teacher'], group_plan__group = value['group_plan__group'])
            tariff = tariffs[0]
            hours = [(t.uch_plan_hour.type, t.uch_plan_hour.count_hours) for t in tariffs]
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