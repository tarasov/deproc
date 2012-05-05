# -*- coding: utf-8 -*-
import datetime
from django.shortcuts import render_to_response, get_object_or_404, get_list_or_404
from django.template.context import RequestContext
from itertools import chain
from deproc.tariffication import models as main_models
from deproc.schedule import models as sch_models
from deproc.schedule import forms

def schedule(request):
    cal = forms.MyCalendarForm()
    return render_to_response('schedule/schedule.html', locals(), context_instance=RequestContext(request))

def index(request):
    groups = main_models.Groups.objects.all().order_by('name')
    teacher_list = main_models.Teachers.objects.all()
    schedule_queryset = sch_models.Schedule.objects.all()

    if request.method == 'GET':
        if 'day' in request.GET and request.GET['day']:
            date = request.GET['day']
            date = date.split('.')
            new_date = ('%s-%s-%s' % tuple(date[::-1]))
            schdl_day = sch_models.Schedule_day.objects.all()

            schdl_day_empty = sch_models.Schedule_empty.objects.all()

            new_date = datetime.datetime.strptime(new_date, '%Y-%m-%d')
            if not sch_models.Schedule_day.objects.filter(day = str(new_date.date())):
                this_day = sch_models.Schedule_day.objects.create(day = new_date.date())
            else:
                this_day = sch_models.Schedule_day.objects.get(day = str(new_date.date()))

            rng = range(1,6)

            schedule_group = {}
            schedule_teacher = {}

#            обратная связь
#            a = sch_models.Schedule_day.objects.get(day = this_day.day)
#            print a.schedule_set.all(), "da?"

#            a = get_object_or_404(sch_models.Schedule, pk = 30)
#            print a

#            a = get_list_or_404(sch_models.Schedule, day = this_day)
#            print a

            for group in groups:
                lessons = {}
                sch = schedule_queryset.filter(
                                                        plan__group_plan__group = group,
                                                        day = this_day
                )
                if sch:
                    for i in range(1,6):
                        if (sch.filter(num_less = i)):
                            lessons[i] = sch.get(num_less = i).plan.uch_plan_hour.uch_plan.disc
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
                            lessons[i] = tch.get(num_less = i).plan.uch_plan_hour.uch_plan.disc
                        else:
                            lessons[i] = ''
                else:
                    for i in range(1,6):
                        lessons[i] = ''

                schedule_teacher[teacher.username] = lessons
            print schedule_teacher


    return render_to_response('schedule/index.html', locals(), context_instance=RequestContext(request))