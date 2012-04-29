# -*- coding: utf-8 -*-
import logging
import re
from django.forms.models import modelformset_factory
from django.shortcuts import render_to_response
from django.http import HttpResponseRedirect, HttpResponseServerError, HttpResponse, HttpResponseNotFound
from django.template import RequestContext
from django.core.urlresolvers import reverse
from django.template.defaulttags import csrf_token
from deproc.tariffication import forms
from deproc.tariffication import models
from deproc.tariffication import forms
from django.db.models import get_models
from deproc.tariffication.models import Tariffication, choice_typeh
from django.db.models import Count
from django.views.decorators.csrf import csrf_protect

# This class is a wrapper to a given widget to add the add icon for the admin interface

# страницы, из которых будет генерироваться urlpatterns
# вид - {адресс ссылки: (Модель, Название)}
pages_list = {
    # page: (Class, Name)
    'groups': ('Groups', 'Группы'),
    'discipline': ('Discipline', 'Дисциплины'),
    'speciality': ('Speciality', 'Специальности'),
    }

actions = (
    'info', 'edit', 'delete'
)



def wellcome(request):
    return render_to_response('tariffication/index.html', locals(), context_instance=RequestContext(request))

def plan_group(request):
    table = ()
    specialty = models.Speciality.objects.all()
    year = models.Year.objects.all().order_by('-date_begin')[0]
    groups_plan = models.Groups_plan.objects.filter(year=year).order_by('-group__spec')

    for i, group_plan in enumerate(groups_plan):
        if i and groups_plan[i-1].group.spec == group_plan.group.spec:
            tr = (('', group_plan.group.name, group_plan.course, group_plan.group.semestr.split(', '), ), )
        else:
            tr = ((group_plan.group.spec.name, group_plan.group.name, group_plan.course, group_plan.group.semestr.split(', '),  ), )
        table += tr

#    print table

    return render_to_response('tariffication/group_plan.html', locals(), context_instance=RequestContext(request))

def tariffication(request):
    choices = choice_typeh
    tariffs = Tariffication.objects.all()
    # узнаем семестры
    semestres = []
    for tariff in tariffs:
        if tariff.uch_plan_hour.uch_plan.semestr not in semestres:
            semestres.append(tariff.uch_plan_hour.uch_plan.semestr)
    # делаем цикл по семестрам для фильтрации тариффикации
    table = ()
    # TODO ПЕРЕДЕЛАТЬ ВСЮ ТАБЛИЦУ
    for semestr in semestres:
        tariffs_values = Tariffication.objects.values(
            'group_plan__group', 'teacher', 'uch_plan_hour__uch_plan__semestr').annotate(
            count = Count('group_plan__group')).filter(
            uch_plan_hour__uch_plan__semestr = semestr)
        tr = tds = ()
        for value in tariffs_values:
            disciplines = Tariffication.objects.values(
                'group_plan__group', 'teacher', 'uch_plan_hour__uch_plan__disc').annotate(
                count = Count('uch_plan_hour__uch_plan__disc')
            ).filter(
                teacher = value['teacher'],
            )
            for discipline in disciplines:
                tariffs = Tariffication.objects.filter(
                    uch_plan_hour__uch_plan__semestr = value['uch_plan_hour__uch_plan__semestr'],
                    teacher = value['teacher'],
                    group_plan__group = value['group_plan__group'],
                    uch_plan_hour__uch_plan__disc = discipline['uch_plan_hour__uch_plan__disc']
                )
                try:
                    tariff = tariffs[0]
                except IndexError:
                    continue
                hours = [(t.uch_plan_hour.type, t.uch_plan_hour.count_hours) for t in tariffs]
                teacher = '%s %s %s' % (tariff.teacher.last_name, tariff.teacher.first_name, tariff.teacher.other_name, )
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

def pages(request, actions=actions):
    # TODO сделать для всех простых страниц
    # специальности, группы, дисциплины, пользователи,
    # студенты, преподователи, [учебный год?]
    # потому что предоставление информации происходит однотипно (показ таблицы)
    path_info = request.META['PATH_INFO'].split('/')[1]
    model_name = pages_list[path_info][0]
    Model = getattr(models, model_name)
    values = Model.objects.all()

    # создание списка заголовков <th></th>
    fields = values[0]._meta.fields
    ths = []
    for field in fields:
        if field.verbose_name == 'ID':
            verbose_name = '#'
        else:
            verbose_name = field.verbose_name
        ths.append((field.name, verbose_name))
    ths = ths + ['' for i in actions]

    table = ()
    for value in values:
        tr = ()
        tr = tr + (value.get_absolute_url(), )
        for th in ths:
            if th:
                tr += (getattr(value, th[0]), )
        table += (tr + actions, )

    return render_to_response('tariffication/pages.html', locals(), context_instance=RequestContext(request))
