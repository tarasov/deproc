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

    tariffs = main_models.Tariffication.objects.filter(
        group_plan__group__name = group,
    )
    choices = main_models.choice_typeh

    table = []
    cba = ''

    for tariff in tariffs:

        abc = tariffs.filter(
            teacher = tariff.teacher,
        )

        if tariff.teacher != cba:
            td = []
            tr = {}
            disc = ''
            teacher = ''
            for ab in abc:

                sch = sch_models.Schedule.objects.filter(
                    plan = ab,
                    plan__uch_plan_hour__uch_plan__spec = ab.uch_plan_hour.uch_plan.spec
                )
                counthrs = 0
#                sch = sch_models.Schedule.objects.filter(plan = ab).annotate(hrs=Count('hour_type'))
#                print sch

                for sc in sch:
                    counthrs += sc.hour_type

                teach = '%s %s. %s.' % (ab.teacher.last_name, ab.teacher.first_name[0], ab.teacher.other_name[0])

                if ab.uch_plan_hour.count_hours == 0:
                    a = ''
                else:
                    a = ab.uch_plan_hour.get_type_display(), ab.uch_plan_hour.count_hours, counthrs, ab.pk
                if teacher == ab.teacher:
                    if ab.uch_plan_hour.uch_plan.disc != disc:
                        tr[teach, disc] = td
                        table.append(tr)
                        td = []
                        tr = {}

                td.append(a)
                tr[teach, ab.uch_plan_hour.uch_plan.disc] = td

                disc = ab.uch_plan_hour.uch_plan.disc
                teacher = ab.teacher

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
                                    hourtype = ss.plan.uch_plan_hour.get_type_display()[0]
                                    ls[j] = ss.plan.uch_plan_hour.uch_plan.disc, teach, hourtype
                                    j += 1
                                lessons[i] = ls
                            else:
                                sc = sch.get(num_less = i)
                                teach = '%s %s. %s.' % (sc.plan.teacher.last_name, sc.plan.teacher.first_name[0], sc.plan.teacher.other_name[0])
                                hourtype = sc.plan.uch_plan_hour.get_type_display()[0]
                                lessons[i] = sch.get(num_less = i).plan.uch_plan_hour.uch_plan.disc, teach, hourtype
                        else:
                            lessons[i] = ''
                else:
                    for i in range(1,6):
                        lessons[i] = ''

                schedule_group[group.name] = lessons

            print teacher_list

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
                                    hourtype = tt.plan.uch_plan_hour.get_type_display()[0]
                                    ls[j] = tt.plan.uch_plan_hour.uch_plan.disc, teach, hourtype
                                    j += 1
                                lessons[i] = ls
                            else:
                                tc = tch.get(num_less = i)
                                teach = '%s %s. %s.' % (tc.plan.teacher.last_name, tc.plan.teacher.first_name[0], tc.plan.teacher.other_name[0])
                                hourtype = tc.plan.uch_plan_hour.get_type_display()[0]
                                lessons[i] = tc.plan.uch_plan_hour.uch_plan.disc, tc.plan.group_plan.group, hourtype
                        else:
                            lessons[i] = ''
                else:
                    for i in range(1,6):
                        lessons[i] = ''
                t = '%s %s. %s.' % (teacher.last_name, teacher.first_name[0], teacher.other_name[0]), teacher.username
                schedule_teacher[t] = lessons

    return render_to_response('schedule/index.html', locals(), context_instance=RequestContext(request))