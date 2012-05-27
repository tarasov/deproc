# -*- coding: utf-8 -*-

import re
from django.core.urlresolvers import reverse
from django.shortcuts import render_to_response
from django.http import HttpResponseRedirect, HttpResponseServerError, HttpResponse, HttpResponseNotFound
from django.template import RequestContext
from deproc.admin.forms import dynamic_form_page
from deproc.tariffication import forms
from deproc.tariffication import models
from deproc.tariffication import views


def add_tariffication(request, action, teacher = None, group = None, discipline = None, semestr = None):
    choices = models.TypeHour.objects.all()
    if request.POST:
        dynamic_form = forms.DynamicForm(choices, request.POST)
    else:
        dynamic_form = forms.DynamicForm(choices)

    if request.POST: # сохраняем
        for choice in choices:
            # для каждого типа часа сохраняем свой учебный план
            if request.POST[str(choice.id)]:
                hour = request.POST[str(choice.id)]
            else:
                hour = 0
            uch_plan_pk = int(request.POST['uch_plan'])
            teacher = request.POST['teacher']
            uch_plan = models.UchPlan.objects.get(pk=uch_plan_pk)
            if models.UchPlanHour.objects.filter(uch_plan=uch_plan, tariffication__teacher = teacher, type = int(choice.id)):
                # уже создан, тогда обновляем часы
                # TODO пересмотреть обновление данных
                uch_plan_id = models.UchPlanHour.objects.get(uch_plan=uch_plan, tariffication__teacher = teacher, type = int(choice.id)).pk
                uch_plan_hour = models.UchPlanHour(pk = uch_plan_id, uch_plan = uch_plan, type = int(choice.id), count_hours = hour)
                uch_plan_hour.count_hour = hour
                uch_plan_hour.save()
            else:
                # создаем часы учебного плана
                uch_plan_hour = models.UchPlanHour(uch_plan=uch_plan, type_hour = choice, count_hours = hour)
                uch_plan_hour.save()
                teacher = models.Teachers(pk=request.POST['teacher'])
                group_plan = models.Groups_plan.objects.get(pk=request.POST['group_plan'])
                models.Tariffication(teacher = teacher, group_plan = group_plan, uch_plan_hour = uch_plan_hour).save()
        return HttpResponseRedirect(reverse('tariffication'))
    else: # показываем пустые формы
        if action == 'edit':
            teacher = models.Teachers.objects.get(id=teacher)
            # Сделать с учетом курса, а то может быть больше 1 записи
            group_plan = models.Groups_plan.objects.get(group=group)
            form_tariffication = forms.TarifficationModel(
                                initial = {
                                    'teacher': teacher,
                                    'group_plan': group_plan
                                }
            )

            uch_plan = models.UchPlan.objects.get(
                disc = discipline,
                semestr = semestr,
            )
            form_uchplan = forms.UchPlanModel(
                initial={
                    'uch_plan': uch_plan
                }
            )
        elif action == 'add':
            form_tariffication = forms.TarifficationModel()
            form_uchplan = forms.UchPlanModel()

    return render_to_response('admin/add_tariffication.html', locals(), context_instance=RequestContext(request))


def add_plan_group(request):
    form_plan_group = forms.PlanGroupForm()
    return render_to_response('admin/add_group_plan.html', locals(), context_instance=RequestContext(request))

def add_page(request):
    """
    Делаем добавления данных
    """
    path_info = request.META['PATH_INFO'].split('/')[1]
    model_name = path_info[0].upper() + path_info[1:]
    Model = getattr(models, model_name)
    # создается ModelForm
    form_inst = dynamic_form_page(Model)

    if request.POST:
        form = form_inst(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(reverse('%s' % path_info))
    else:
        form = form_inst()

    url = reverse('%s' % model_name.lower())
    return render_to_response('admin/add_page.html', locals(), context_instance=RequestContext(request))

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
#    print table
    return render_to_response('admin/info_page.html', locals(), context_instance=RequestContext(request))


def edit_page(request, pk):
    """
    Делаем редактирование выбранных данных
    """
    path_info = request.META['PATH_INFO'].split('/')[1]
    model_name = path_info[0].upper() + path_info[1:]
    Model = getattr(models, model_name)
    # создается ModelForm
    form_inst = dynamic_form_page(Model)

    if request.POST:
        form = form_inst(request.POST, instance = Model.objects.get(pk=pk))
        if form.is_valid():
            form.save()
    else:
        form = form_inst(instance = Model.objects.get(pk=pk))

    url = reverse('%s' % model_name.lower())
    return render_to_response('admin/edit_page.html', locals(), context_instance=RequestContext(request))

def delete_page(request, pk, confirm = False):
    """
    Удаляем выбранные данные
    """
    path_info = request.META['PATH_INFO'].split('/')[1]
    model_name = path_info[0].upper() + path_info[1:]
    Model = getattr(models, model_name)
    Model.objects.get(pk=pk).delete()
    return HttpResponseRedirect(reverse('%s' % path_info))
