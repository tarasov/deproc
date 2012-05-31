# -*- coding: utf-8 -*-
import logging
import re
from django.contrib.auth.views import login, logout
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


# страницы, из которых будет генерироваться urlpatterns
# вид - {адресс ссылки: (Модель, Название)}
pages_list = {
    # page: (Class, Name)
    'groups': ('Groups', 'Группы'),
    'discipline': ('Discipline', 'Дисциплины'),
    'speciality': ('Speciality', 'Специальности'),
    }

actions = (
    'info', 'edit',
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

    return render_to_response('tariffication/group_plan.html', locals(), context_instance=RequestContext(request))

def tariffication(request):

    teachers = models.Teachers.objects.all()
    groups = models.Groups.objects.all()
    typehours = models.TypeHour.objects.all()

    table = []
    for teacher in teachers:
        # выбираем группы в которых преподает преподователь
        for group in teacher.get_groups():
            # выбираем дисциплины, которые которые относятся к группе и преподователю
            for discipline in group.get_disciplines(teacher):
                tr = {}
                tariffications = Tariffication.objects.filter(
                    teacher = teacher,
                    group_plan__group = group,
                    uch_plan_hour__uch_plan__disc = discipline
                ).select_related('group_plan__group', 'uch_plan_hour__uch_plan__disc')

                for i, tariffication in enumerate(tariffications):
                    if not i:
                        tr = {
                            'teacher': teacher,
                            'group': group,
                            'discipline': discipline,
                            'semestr': tariffication.semestr,
                            'hours': [tariffication.count_hours],
                            }
                    else:
                        tr['hours'].append(tariffication.count_hours)
                table.append(tr)

    return render_to_response('tariffication/tariffication.html', locals(), context_instance=RequestContext(request))

def pages(request, page, actions = actions):
    # TODO сделать для всех простых страниц
    # специальности, группы, дисциплины, пользователи,
    # студенты, преподователи, [учебный год?]
    # потому что предоставление информации происходит однотипно (показ таблицы)
    model_name = pages_list[page][0]
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
