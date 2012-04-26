# -*- coding: utf-8 -*-
import datetime
from django.shortcuts import render_to_response
from django.template.context import RequestContext
from itertools import chain
from deproc.main import models as main_models
from deproc.schedule import models as sch_models
from deproc.schedule import forms

def schedule(request):
    cal = forms.MyCalendarForm()
    return render_to_response('schedule/schedule.html', locals(), context_instance=RequestContext(request))

def index(request):
    groups = main_models.Groups.objects.all()

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
                for grp in groups:
                    for i in range(1,6):
                        sch_models.Schedule_empty.objects.create(group = grp, day = this_day, num_less = i)
                        print grp, i
            else:
                this_day = sch_models.Schedule_day.objects.get(day = str(new_date.date()))

            schdd = sch_models.Schedule_empty.objects.filter(day = this_day)
            schfld = sch_models.Schedule_filled.objects.filter(lesson = schdd)
            teacher_list = main_models.Profile.objects.filter(groups__name="Преподаватели")

#            for schh in schdl_day:
#                if schh.day == new_date.date():
#                    teacher_list = main_models.Profile.objects.filter(groups__name="Преподаватели")
#                    schdd = sch_models.Schedule.objects.filter(day = sch_models.Schedule_day.objects.get(day = str(new_date.date())))

#            for schh in schdl_day:
#                if schh.day == new_date.date():
#                    teacher_list = main_models.Profile.objects.filter(groups__name="Преподаватели")
#                    schdd = sch_models.Schedule_empty.objects.filter(day = this_day)


    return render_to_response('schedule/index.html', locals(), context_instance=RequestContext(request))

# разделить на курсы
# при логине - показывать только относящиеся к юзеру объекты
# аккуратный вывод
# всё остальное так же
#http://stackoverflow.com/questions/431628/how-to-combine-2-or-more-querysets-in-a-django-view