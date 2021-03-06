# -*- coding: utf-8 -*-

import re
from django.core.urlresolvers import reverse
from django.shortcuts import render_to_response
from django.http import HttpResponseRedirect, HttpResponseServerError, HttpResponse, HttpResponseNotFound
from django.template import RequestContext
from deproc.admin.forms import dynamic_form_page
from deproc.tariffication import forms, models
from deproc.tariffication.views import pages_list


def add_tariffication(request, action, teacher = None, group = None, discipline = None, semestr = None):
    typehours = models.TypeHour.objects.all()
    if request.POST: # сохраняем
        dynamic_form = forms.DynamicForm(request.POST)
        for typehour in typehours:
            # для каждого типа часа сохраняем свой учебный план
            if request.POST[typehour.short_name]:
                hour = request.POST[typehour.short_name]
            else:
                hour = 0
            uch_plan_pk = int(request.POST['uch_plan'])
            teacher = request.POST['teacher']
            uch_plan = models.UchPlan.objects.get(pk=uch_plan_pk)
            if models.UchPlanHour.objects.filter(uch_plan=uch_plan, tariffication__teacher = teacher, type_hour = typehour):
                # уже создан, тогда обновляем часы
                uch_plan_id = models.UchPlanHour.objects.get(uch_plan=uch_plan, tariffication__teacher = teacher, type_hour = typehour).pk
                uch_plan_hour = models.UchPlanHour(pk = uch_plan_id, uch_plan = uch_plan, type_hour = typehour, count_hours = hour)
                uch_plan_hour.count_hour = hour
                uch_plan_hour.save()
            else:
                # создаем часы учебного плана
                uch_plan_hour = models.UchPlanHour(uch_plan=uch_plan, type_hour = typehour, count_hours = hour)
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
# MultipleObjectsReturned  get() returned more than one UchPlan -- it returned 2! Lookup parameters were {'semestr': u'1', 'disc': u'26'}

            uch_plan = models.UchPlan.objects.filter(
                disc = discipline,
                semestr = semestr,
            )
            form_uchplan = forms.UchPlanModel(
                initial={
                    'uch_plan': uch_plan
                }
            )
            group = models.Groups.objects.get(id = group)
            discipline = models.Discipline.objects.get(id = discipline)
            tariffications = models.Tariffication().get_tariffication(teacher=teacher, group=group, discipline=discipline)
            dynamic_form = forms.DynamicForm(tariffications)

        elif action == 'add':
            dynamic_form = forms.DynamicForm()
            form_tariffication = forms.TarifficationModel()
            form_uchplan = forms.UchPlanModel()

    return render_to_response('admin/add_tariffication.html', locals(), context_instance=RequestContext(request))

def add_plan_group(request):
    if request.POST:
        form = forms.PlanGroupForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(reverse('group_plan'))
        else:
            return render_to_response('admin/add_group_plan.html', locals(), context_instance=RequestContext(request))
    else:
        form = forms.PlanGroupForm()
    return render_to_response('admin/add_group_plan.html', locals(), context_instance=RequestContext(request))

def action_page(request, page, pk = None, action = None):
    back_url, page = page, pages_list.get(page)[0] # узнаем название модели
    Model = getattr(models, page)
    form_inst = dynamic_form_page(Model)
    if action == 'edit':
        text = u'Редактировать %s' % (Model._meta.verbose_name, )
    elif action == 'add':
        text = u'Добавить {0}'.format(Model._meta.verbose_name)
    else:
        text = u'Информация'

    isdelete = False
    if request.POST:
        if pk: # редактирование
            # если форма пустая, то удаляем ее
            for key, value in request.POST.iteritems():
                # не проверяем токен. потому что он всегда есть
                if key == 'csrfmiddlewaretoken':
                    continue
                # если хоть одно значение указано, то завершаем проверку и редактируем
                if value:
                    isdelete = False
                    break
                isdelete = True

            if isdelete:
                # TODO переписать метод удаления, лучше добавить поле is_delete = True
                Model.objects.get(pk=pk).delete()
                return HttpResponseRedirect('/{0}/'.format(back_url))
            form = form_inst(request.POST, instance = Model.objects.get(pk=pk))
        else: # добавление
            form = form_inst(request.POST)

        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/{0}/'.format(back_url))

    if pk:
        value = Model.objects.get(pk=pk)
        if action == 'info':
            fields = value._meta.fields
            table = ()
            for field in fields:
                if field.name == 'id': continue # заменяем id на #
                tr = (field.verbose_name, getattr(value, field.name))
                table += (tr, )
        else:
            form = form_inst(instance = Model.objects.get(pk=pk))
    else:
        form = form_inst()
    return render_to_response('admin/action_page.html'.format(action), locals(), context_instance=RequestContext(request))
