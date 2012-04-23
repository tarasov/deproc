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

#    disc_filter = main_models.Tariffication.objects.filter(pk = schdl)
#    disc = main_models.Discipline.objects.get(pk = disc_filter)
#    print disc
    return render_to_response('schedule/schedule.html', locals(), context_instance=RequestContext(request))

def index(request):

    if request.method == 'GET':
        if 'day' in request.GET and request.GET['day']:
            date = request.GET['day']
            date = date.split('.')
            new_date = ('%s-%s-%s' % tuple(date[::-1]))
            schdl_day = sch_models.Schedule_day.objects.all()
            new_date = datetime.datetime.strptime(new_date, '%Y-%m-%d')
            if not sch_models.Schedule_day.objects.filter(day = str(new_date.date())):
                sch_models.Schedule_day.objects.create(day = new_date.date())

            for schh in schdl_day:
                if schh.day == new_date.date():
                    groups = main_models.Groups.objects.all()
                    teacher_list = main_models.Profile.objects.filter(groups__name="Преподаватели")
                    schdd = sch_models.Schedule.objects.get(day = sch_models.Schedule_day.objects.get(day = str(new_date.date())))
                    print schdd


#            day_schedule = sch_models.Schedule.objects.filter(day = new_date)
#            print day_schedule

#    disc_filter = main_models.Tariffication.objects.filter()
#
#    result_list = []
#    disc_list = main_models.Discipline.objects.all()
#    group_list = main_models.Groups.objects.all()
#    teacher_list = main_models.Profile.objects.filter(groups__name="Преподаватели")
#    result_list = list(chain(disc_list, group_list, teacher_list))
#    absnc = sch_models.Absences.objects.all()
#    clsrm = sch_models.Classroom.objects.all()
#    groups = main_models.Groups.objects.all()
    return render_to_response('schedule/index.html', locals(), context_instance=RequestContext(request))

# разделить на курсы
# при логине - показывать только относящиеся к юзеру объекты
# аккуратный вывод
# всё остальное так же
#http://stackoverflow.com/questions/431628/how-to-combine-2-or-more-querysets-in-a-django-view