# -*- coding: utf-8 -*-
import datetime
from django.shortcuts import render_to_response
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

            schedule_group = ()
            schedule_teacher = ()

            for group in groups:
                sch = sch_models.Schedule.objects.filter(plan__group_plan__group = group).filter(day = this_day)
                if sch:
                    for i in range(1,6):
                        if (sch.filter(num_less = i)):
                            schedule_group += tuple(sch.filter(num_less = i)),
                        else:
                            schedule_group += (group, i),
                else:
                    for i in range(1,6):
                        schedule_group += (group, i),

            print schedule_group



            print "----------------------------------------------------------------"
            for teacher in teacher_list:
                tch = sch_models.Schedule.objects.filter(plan__teacher = teacher).filter(day = this_day)
                if tch:
                    print "true"
                    for i in range(1,6):
                        if (tch.filter(num_less = i)):
                            print tch.filter(num_less = i)
                        else:
                            print teacher, this_day.day, i
                else:
                    print "false"
                    for i in range(1,6):
                        print teacher, this_day.day, i

#shedule_group = (
#    {'group': 808, 'predmet': POKS, 'para': 2},
#    {'group': 808, 'predmet': IZO, 'para': 4}
#    )
#а потом for group, predmet, para in shedule_group: # распаковка словаря
## что бы потом писать {{ group }} {{ para }},
#           а не for td in tds:
#                {{ td.0 }}

#            themes = Themes.objects.all()
#
#            table = ()
#            for student_group in students_group:
#                marks = Assessment.objects.filter(student=student_group.student).order_by('theme')
#                tr = ((Profile.objects.get(pk=student_group.student).pk, Profile.objects.get(pk=student_group.student).__unicode__(), ), )
#                marks_themes = [(mark.theme.pk, mark.mark) for mark in marks]
#                # оценок нету у студента
#                if not marks_themes:
#                    tr += tuple(((i+1, 0) for i in xrange(len(themes))))
#                    table += (tr, )
#                    break
#
#                for theme in themes:
#                    if theme.pk in dict(marks_themes).keys():
#                        tr += ((theme.pk, dict(marks_themes)[theme.pk]), )
#                    else:
#                        tr += ((theme.pk, 0), )
#
#                table += (tr, )


    return render_to_response('schedule/index.html', locals(), context_instance=RequestContext(request))

# разделить на курсы
# при логине - показывать только относящиеся к юзеру объекты
# аккуратный вывод
# всё остальное так же
#http://stackoverflow.com/questions/431628/how-to-combine-2-or-more-querysets-in-a-django-view