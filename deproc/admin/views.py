# -*- coding: utf-8 -*-

import re
from django.shortcuts import render_to_response
from django.http import HttpResponseRedirect, HttpResponseServerError, HttpResponse, HttpResponseNotFound
from django.template import RequestContext
from deproc.main import forms
from deproc.main import models


def add_tariffication(request):
    choices = models.choice_typeh
    if request.POST:
        dynamic_form = forms.DynamicForm(choices, request.POST)
    else:
        dynamic_form = forms.DynamicForm(choices)

    if request.POST:
        for choice in choices:
            # для каждого типа часа сохраняем свой учебный план
            if request.POST[choice[0]]:
                hour = request.POST[choice[0]]
            else:
                hour = 0
            uch_plan_pk = int(request.POST['uch_plan'])
            uch_plan = models.UchPlan.objects.get(pk=uch_plan_pk)
            if models.UchPlanHour.objects.filter(uch_plan=uch_plan, type = choice[0]):
                # уже создан, тогда обновляем часы
                # TODO пересмотреть обновление данных
                uch_plan_pk = models.UchPlanHour.objects.get(uch_plan=uch_plan, type = choice[0]).pk
                uch_plan_hour = models.UchPlanHour(pk = uch_plan_pk, uch_plan = uch_plan, type = choice[0], count_hours = hour)
                uch_plan_hour.count_hour = hour
                uch_plan_hour.save()
            else:
                # создаем часы учебного плана
                uch_plan_hour = models.UchPlanHour(uch_plan=uch_plan, type = choice[0], count_hours = hour)
                uch_plan_hour.save()
                teacher = request.POST['teacher']
                group_plan = models.Groups_plan.objects.get(pk=request.POST['group_plan'])
                models.Tariffication(teacher = teacher, group_plan = group_plan, uch_plan_hour = uch_plan_hour).save()
        form_tariffication = forms.TarifficationModel(request.POST)
        form_uchplanhour = forms.UchPlanHourModel(request.POST)
    else:
        form_tariffication = forms.TarifficationModel()
        form_uchplanhour = forms.UchPlanHourModel()

    return render_to_response('admin/add_tariffication.html', locals(), context_instance=RequestContext(request))


def add_plan_group(request):
    form_plan_group = forms.PlanGroupForm()
    return render_to_response('admin/add_group_plan.html', locals(), context_instance=RequestContext(request))

# действия для страниц
def info_page(request, pk):
    path_info = request.META['PATH_INFO'].split('/')[1]
    model_name = path_info[0].upper() + path_info[1:]
    Model = getattr(models, model_name)
    value = Model.objects.get(pk=pk)
    # названия полей выбранной модели
    fields = value._meta.fields

    table = ()
    for field in fields:
        if field.name == 'id': continue
        tr = (field.verbose_name, getattr(value, field.name))
        table += (tr, )
    print table
    return render_to_response('admin/info_page.html', locals(), context_instance=RequestContext(request))


def edit_page(request, pk):
    """
    Делаем редактирование выбранных данных
    """
    return HttpResponseRedirect(request.META['HTTP_REFERER'])

def delete_page(request, pk):
    """
    Делаем удаление выбранных данных
    """
    return HttpResponseRedirect(request.META['HTTP_REFERER'])
