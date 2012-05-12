# -*- coding: utf-8 -*-
import datetime
from telepathy._generated.errors import DoesNotExist
from django.core.exceptions import MultipleObjectsReturned
from django.http import Http404, HttpResponseRedirect
from django.shortcuts import render_to_response, get_object_or_404, get_list_or_404
from django.template.context import RequestContext
from itertools import chain
from deproc.tariffication import models as main_models
from deproc.schedule import models as sch_models
from deproc.schedule import forms
from django.db.models import Count


def schedule(request):
    cal = forms.MyCalendarForm()
    return render_to_response('schedule/schedule.html', locals(), context_instance=RequestContext(request))

def add_lesson(request, year, month, day, group, lesson, plan):
#    print plan
    this_day = sch_models.Schedule_day.objects.get(
        day__day = day,
        day__month = month,
        day__year = year
    )
    this_plan = main_models.Tariffication.objects.get(pk = plan)
    print this_plan
    sch_models.Schedule.objects.create(plan = this_plan, day = this_day, num_less = lesson, hour_type = 2)
    return HttpResponseRedirect('/schedule/index?day=' + day + '.' + month + '.' + year)

def lesson(request, year, month, day, group, lesson):
    tariffs = main_models.Tariffication.objects.filter(group_plan__group__name = group).select_related("group_plan__group__name", "uch_plan_hour__uch_plan__disc__name")
    choices = main_models.choice_typeh

    table = []
    cba = ''


    for tariff in tariffs:
        abc = main_models.Tariffication.objects.filter(
            teacher = tariff.teacher,
        ).select_related()
        if tariff.teacher != cba:
            td = []
            tr = {}
            do_position = 0
            for ab in abc:

                sch = sch_models.Schedule.objects.filter(plan = ab)
                counthrs = 0

                for sc in sch:
                    counthrs += sc.hour_type

#                cnt = sch_models.Schedule.objects.filter(plan = ab).count()
#                print cnt


                a = ab.uch_plan_hour.get_type_display(), ab.uch_plan_hour.count_hours, counthrs, ab.pk
                td.append(a)
                tr[ab.teacher, ab.uch_plan_hour.uch_plan] = td
            table.append(tr)
        cba = tariff.teacher

    return render_to_response('schedule/lesson.html', locals(), context_instance=RequestContext(request))


def index(request):
    groups = main_models.Groups.objects.all()
    teacher_list = main_models.Teachers.objects.all()
    schedule_queryset = sch_models.Schedule.objects.all().select_related(
        "plan__uch_plan_hour__uch_plan__disc",
        "plan__group_plan__group",
        "plan__teacher",
    )

    if request.method == 'GET':
        if 'day' in request.GET and request.GET['day']:
            date = request.GET['day']
            date = date.split('.')
            new_date = ('%s-%s-%s' % tuple(date[::-1]))
            schdl_day = sch_models.Schedule_day.objects.all().select_related()
            new_date = datetime.datetime.strptime(new_date, '%Y-%m-%d')
            if not schdl_day.filter(day = str(new_date.date())):
                this_day = schdl_day.create(day = new_date.date())
            else:
                this_day = schdl_day.get(day = str(new_date.date()))
            day = '%s-%s-%s' % (this_day.day.year, this_day.day.month, this_day.day.day)
            rng = range(1,6)

#            print '_year_%s_month_%s_day_%s_hour_%s_minute_%s' % (datetime.datetime.now().year, datetime.datetime.now().month, datetime.datetime.now().day, datetime.datetime.now().hour, datetime.datetime.now().minute)

            schedule_group = {}
            schedule_teacher = {}

#            обратная связь
#            a = sch_models.Schedule_day.objects.get(day = this_day.day)
#            print a.schedule_set.all(), "da?"
#
#            a = get_object_or_404(sch_models.Schedule, pk = 30)
#            print a

#            a = get_list_or_404(sch_models.Schedule, day = this_day)
#            print a
            #                                sc = sch.get(num_less = i)

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
                            except MultipleObjectsReturned:
                                sc = sch.filter(num_less = i)
                                j = 1
                                ls = {}
                                for ss in sc:
                                    teach = '%s %s. %s.' % (ss.plan.teacher.last_name, ss.plan.teacher.first_name[0], ss.plan.teacher.other_name[0])
                                    type_hour = ss.plan.uch_plan_hour.get_type_display()[0]
                                    ls[j] = ss.plan.uch_plan_hour.uch_plan.disc, teach, type_hour
                                    j += 1
                                lessons[i] = ls
                            else:
                                sc = sch.get(num_less = i)
                                teach = '%s %s. %s.' % (sc.plan.teacher.last_name, sc.plan.teacher.first_name[0], sc.plan.teacher.other_name[0])
                                type_hour = sc.plan.uch_plan_hour.get_type_display()[0]
                                lessons[i] = sch.get(num_less = i).plan.uch_plan_hour.uch_plan.disc, teach, type_hour
                        else:
                            lessons[i] = ''
                else:
                    for i in range(1,6):
                        lessons[i] = ''

                schedule_group[group.name] = lessons


            for teacher in teacher_list:
                lessons = {}
                tch = schedule_queryset.filter(
                    plan__teacher = teacher,
                    day = this_day
                )
                if tch:
                    for i in range(1,6):
                        if (tch.filter(num_less = i)):
                            tc = tch.get(num_less = i)
                            type_hour = tc.plan.uch_plan_hour.type
                            lessons[i] = tc.plan.uch_plan_hour.uch_plan.disc, tc.plan.group_plan.group, type_hour
                        else:
                            lessons[i] = ''
                else:
                    for i in range(1,6):
                        lessons[i] = ''
                t = '%s %s. %s.' % (teacher.last_name, teacher.first_name[0], teacher.other_name[0]), teacher.username
                schedule_teacher[t] = lessons

    return render_to_response('schedule/index.html', locals(), context_instance=RequestContext(request))