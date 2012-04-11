# -*- coding: utf-8 -*-
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
            print new_date
#            print date[0:2], date[3:5], date[6:10]

            day_schedule = sch_models.Schedule.objects.filter(day = new_date)
            print day_schedule

    disc_filter = main_models.Tariffication.objects.filter()

    result_list = []
    disc_list = main_models.Discipline.objects.all()
    group_list = main_models.Groups.objects.all()
    teacher_list = main_models.Profile.objects.filter(groups__name="Преподаватели")
#    print teacher_list

    result_list = list(chain(disc_list, group_list, teacher_list))
#    print result_list
    schdl = sch_models.Schedule.objects.all()
    schdl_day = sch_models.Schedule_day.objects.all()
    for schh in schdl_day:
        print schh
    absnc = sch_models.Absences.objects.all()
    clsrm = sch_models.Classroom.objects.all()
    groups = main_models.Groups.objects.all()
    return render_to_response('schedule/index.html', locals(), context_instance=RequestContext(request))

# разделить на курсы
# при логине - показывать только относящиеся к юзеру объекты
# аккуратный вывод
# всё остальное так же
#http://stackoverflow.com/questions/431628/how-to-combine-2-or-more-querysets-in-a-django-view