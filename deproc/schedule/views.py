# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response
from django.template.context import RequestContext
from deproc.main import models as main_models
from deproc.schedule import models as sch_models
from deproc.schedule import forms

def schedule(request):
#    cal = forms.CalendarForm()
#    call = forms.EventForm()
    schdl = sch_models.Schedule.objects.all()
    schdl_day = sch_models.Schedule_day.objects.all()
    absnc = sch_models.Absences.objects.all()
    clsrm = sch_models.Classroom.objects.all()
    groups = main_models.Groups.objects.all()

#    disc_filter = main_models.Tariffication.objects.filter(pk = schdl)
#    disc = main_models.Discipline.objects.get(pk = disc_filter)
#    print disc
    return render_to_response('schedule/schedule.html', locals(), context_instance=RequestContext(request))

# разделить на курсы
# при логине - показывать только относящиеся к юзеру объекты
# аккуратный вывод
# всё остальное так же