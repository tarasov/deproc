# -*- coding: utf-8 -*-
import datetime
from django.core.exceptions import MultipleObjectsReturned
from django.db.models.aggregates import Sum
from django.http import Http404, HttpResponseRedirect, HttpResponse
from django.shortcuts import render_to_response, get_object_or_404, get_list_or_404, redirect
from django.template.context import RequestContext
from itertools import chain
from deproc.tariffication import models as main_models
from deproc.schedule import models as sch_models
from deproc.schedule import forms
import json

def add_lesson(request, year, month, day, group, lesson, plan, count_hours = 2):

    link = '/schedule/lesson/' + year + '-' + month + '-' + day + '/' + group + '/' + lesson

    this_day = sch_models.Schedule_day.objects.get(
        day__day = day,
        day__month = month,
        day__year = year
    )
    this_plan = main_models.Tariffication.objects.get(pk = plan)

    flt_teacher = sch_models.Schedule.objects.filter(
        plan__teacher = this_plan.teacher,
        day = this_day,
        num_less = lesson
    )

    flt_group = sch_models.Schedule.objects.filter(
        plan__group_plan__group = this_plan.group_plan.group,
        day = this_day,
        num_less = lesson
    )

    vsego = main_models.Tariffication.objects.get(
        pk = this_plan.pk
    )

    vidano = sch_models.Schedule.objects.filter(
        plan = this_plan
    ).aggregate(count=Sum('count_hours'))
    if not vidano['count']:
        vidano['count'] = 0


    if flt_teacher.count() > 0:
        er = 1
        link += "?error=%s" % er
    elif flt_group.count() >= 2:
        er = 2
        link += "?error=%s" % er
    elif  vidano['count'] >= vsego.uch_plan_hour.count_hours:
        er = 3
        link += "?error=%s" % er
    elif  int(count_hours) + int(vidano['count']) > vsego.uch_plan_hour.count_hours:
        er = 4
        link += "?error=%s" % er
    else:
        er = 0
        link += '/'
        sch_models.Schedule.objects.create(plan = this_plan, day = this_day, num_less = lesson, count_hours = count_hours)

    return HttpResponseRedirect(link)


def delete_lesson(request, year, month, day, group, lesson, id_lesson):
    sch_models.Schedule.objects.get(pk = id_lesson).delete()
    return HttpResponseRedirect('/schedule/lesson/' + year + '-' + month + '-' + day + '/' + group + '/' + lesson + '/')

def lesson(request, year, month, day, group, lesson):
    warning = False
    error = request.GET.get('error')
    if error == '1':
        warning = True
        message = 'У преподавателя уже есть пара'
    elif error == '2':
        warning = True
        message = 'У группы не может быть больше 2 пар'
    elif error == '3':
        warning = True
        message = 'Все часы выданы'
    elif error == '4':
        warning = True
        message = 'Достигнут предел часов, попробуйте выбрать меньшее количество часов'
    elif error == '0':
        warning = False

    typehour = main_models.TypeHour.objects.all()

    sum_hours = []
    for typeh in typehour:

        vsego = main_models.Tariffication.objects.filter(
            group_plan__group__name = group,
            uch_plan_hour__type_hour = typeh
        ).aggregate(count=Sum('uch_plan_hour__count_hours'))
        if not vsego['count']:
            vsego['count'] = 0


        vidano = sch_models.Schedule.objects.filter(
            plan__group_plan__group__name = group,
            plan__uch_plan_hour__type_hour = typeh
        ).aggregate(count=Sum('count_hours'))
        if not vidano['count']:
            vidano['count'] = 0

        if vsego and vidano:
            sum_hours.append({
                'type': typeh,
                'vsego': vsego['count'],
                'vidano': vidano['count']
            })

    frange = range(1,6)
    now_lesson = int(lesson)

    this_day = sch_models.Schedule_day.objects.get(
        day__day = day,
        day__month = month,
        day__year = year
    )

    list_lessons = sch_models.Schedule.objects.filter(
        plan__group_plan__group__name = group,
        day = this_day,
        num_less = lesson
    ).select_related()

    lessons = {}

    for lt in list_lessons:
        teach = '%s %s. %s.' % (lt.plan.teacher.last_name, lt.plan.teacher.first_name[0], lt.plan.teacher.other_name[0])
        dsc = lt.plan.uch_plan_hour.uch_plan.disc
        tpdsc = lt.plan.uch_plan_hour.type_hour.name
        count_hours = lt.count_hours
        lessons[teach] = dsc, tpdsc, count_hours, lt.pk, lt.plan.teacher.pk

    tariffs = main_models.Tariffication.objects.filter(
        group_plan__group__name = group,
    ).order_by('teacher', 'uch_plan_hour__uch_plan__disc', 'uch_plan_hour__type_hour').select_related()

    table = []
    last_teacher = ''

    for tariff in tariffs:

        tariffs_teacher = tariffs.filter(
            teacher = tariff.teacher,
        )

        if tariff.teacher != last_teacher:
            td = []
            tr = {}
            disc = ''
            teacher = ''
            for tariff_teacher in tariffs_teacher:

                hours = sch_models.Schedule.objects.filter(
                    plan = tariff_teacher,
                    plan__uch_plan_hour__uch_plan__spec = tariff_teacher.uch_plan_hour.uch_plan.spec
                ).aggregate(count=Sum('count_hours'))
                if not hours['count']:
                    hours['count'] = 0

                teach = '%s %s. %s.' % (tariff_teacher.teacher.last_name, tariff_teacher.teacher.first_name[0], tariff_teacher.teacher.other_name[0])

                if tariff_teacher.uch_plan_hour.count_hours == 0:
                    lesson_info = ''
                else:
                    lesson_info = tariff_teacher.uch_plan_hour.type_hour.short_name, tariff_teacher.uch_plan_hour.count_hours, hours['count'], tariff_teacher.pk
                if teacher == tariff_teacher.teacher:
                    if tariff_teacher.uch_plan_hour.uch_plan.disc != disc:
                        tr[teach, disc] = td
                        table.append(tr)
                        td = []
                        tr = {}

                td.append(lesson_info)
                tr[teach, tariff_teacher.uch_plan_hour.uch_plan.disc] = td

                disc = tariff_teacher.uch_plan_hour.uch_plan.disc
                teacher = tariff_teacher.teacher

            table.append(tr)
        last_teacher = tariff.teacher


    return render_to_response('schedule/lesson.html', locals(), context_instance=RequestContext(request))

def index_now(request):
    day = datetime.datetime.now().strftime('%d.%m.%Y')
    return index(request, None, day)

def index(request, id_profile = None, day = None):
    date = None
    if day:
        date = day
        tomorrow = datetime.datetime.now() + datetime.timedelta(days=1)
    elif 'day' in request.GET:
        date = request.GET['day']
        dd = date.split('.')[::-1]
        date_ = datetime.date(int(dd[0]), int(dd[1]), int(dd[2]))
        tomorrow = date_ + datetime.timedelta(days=1)


    id_teacher, id_student = None, None

    backlink = '/schedule/'

    if main_models.Teachers.objects.filter(id=id_profile):
        id_teacher = id_profile
    else:
        id_student = id_profile


    if id_student:
        student = main_models.Students.objects.get(id=id_student)
        groups = main_models.Groups.objects.filter(id=student.group.pk)
    else:
        groups = main_models.Groups.objects.all()

    if id_teacher:
        teacher_list = main_models.Teachers.objects.filter(id=id_teacher)
    else:
        teacher_list = main_models.Teachers.objects.all()

    schedule_queryset = sch_models.Schedule.objects.all().select_related(
        "plan__uch_plan_hour__uch_plan__disc",
        "plan__group_plan__group",
        "plan__teacher",
    )

    if date:
        date = date.split('.')
        new_date = ('%s-%s-%s' % tuple(date[::-1]))
        schdl_day = sch_models.Schedule_day.objects.all()
        new_date = datetime.datetime.strptime(new_date, '%Y-%m-%d')
        if not schdl_day.filter(day = str(new_date.date())):
            this_day = schdl_day.create(day = new_date.date())
        else:
            this_day = schdl_day.get(day = str(new_date.date()))
        day = '%s-%s-%s' % (this_day.day.year, this_day.day.month, this_day.day.day)
        rng = range(1,6)

        schedule_group = {}
        schedule_teacher = {}

        for teacher in teacher_list:
            lessons = {}
            tch = schedule_queryset.filter(
                plan__teacher = teacher,
                day = this_day
            )

            if tch:
                for i in range(1,6):
                    if (tch.filter(num_less = i)):
                        try:
                            tc = get_object_or_404(tch, num_less = i)
                        except MultipleObjectsReturned:
                            tc = tch.filter(num_less = i)
                            j = 1
                            ls = {}
                            for tt in tc:
                                teach = '%s %s. %s.' % (tt.plan.teacher.last_name, tt.plan.teacher.first_name[0], tt.plan.teacher.other_name[0])
                                hourtype = tt.plan.uch_plan_hour.type_hour.short_name
                                ls[j] = tt.plan.disc.short_name, teach, hourtype
                                j += 1
                            lessons[i] = ls
                        else:
                            tc = tch.get(num_less = i)
                            teach = '%s %s. %s.' % (tc.plan.teacher.last_name, tc.plan.teacher.first_name[0], tc.plan.teacher.other_name[0])
                            hourtype = tc.plan.uch_plan_hour.type_hour.short_name
                            lessons[i] = tc.plan.disc.short_name, tc.plan.group_plan.group.name, hourtype
                    else:
                        lessons[i] = ''
            else:
                for i in range(1,6):
                    lessons[i] = ''
            t = '%s %s. %s.' % (teacher.last_name, teacher.first_name[0], teacher.other_name[0])
            schedule_teacher[t] = lessons

        if id_teacher:
            if not any(schedule_teacher.values()[0].values()):
                schedule_teacher = {}
            return HttpResponse(json.dumps(schedule_teacher))

        for group in groups:
            lessons = {}
            sch = schedule_queryset.filter(
                plan__group_plan__group = group,
                day = this_day
            )

            if sch:
                for i in range(1,6):
                    if (sch.filter(num_less = i)):
                        try:
                            sc = get_object_or_404(sch, num_less = i)
                            teach = '%s %s. %s.' % (sc.plan.teacher.last_name, sc.plan.teacher.first_name[0], sc.plan.teacher.other_name[0])
                            hourtype = sc.plan.uch_plan_hour.type_hour.short_name
                            lessons[i] = sch.get(num_less = i).plan.disc.short_name, teach, hourtype
                        except MultipleObjectsReturned:
                            sc = sch.filter(num_less = i)
                            j = 1
                            ls = {}
                            for ss in sc:
                                teach = '%s %s. %s.' % (ss.plan.teacher.last_name, ss.plan.teacher.first_name[0], ss.plan.teacher.other_name[0])
                                hourtype = ss.plan.uch_plan_hour.type_hour.short_name
                                ls[j] = ss.plan.disc.short_name, teach, hourtype
                                j += 1
                            lessons[i] = ls
                    else:
                        lessons[i] = ''
            else:
                for i in range(1,6):
                    lessons[i] = ''

            schedule_group[group.name] = lessons

            if id_student:
                if not any(schedule_group.values()[0].values()):
                    schedule_group = {}
                return HttpResponse(json.dumps(schedule_group))


    return render_to_response('schedule/schedule.html', locals(), context_instance=RequestContext(request))