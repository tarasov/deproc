# -*- coding: utf-8 -*-
from django.db.models.aggregates import Count
from django.shortcuts import render_to_response, get_object_or_404
from django.http import HttpResponseRedirect, HttpResponse
from django.template.context import RequestContext
from deproc.journal.models import Assessment, Theme_of_day
from deproc.journal.forms import ThemeForm
from deproc.tariffication.models import Groups, Profile, Groups_stud, Discipline, Tariffication, Groups_plan, User, Teachers, Students
from deproc.schedule.models import Schedule_day, Schedule
from django.core.urlresolvers import reverse

def journal(request, teacher, group, discipline):
    """
    журнал для группы
    """
    form_lab = ThemeForm(label_suffix='')

    current_group = get_object_or_404(Groups, pk=group)
    current_discipline = get_object_or_404(Discipline, pk=discipline)

    group = get_object_or_404(Groups_stud, group=current_group)
    days_of_schedule = Schedule.objects.filter(plan__teacher=teacher).order_by('day')[:10]
    students = group.student.all()
    journal_days = []
    for day_of_schedule in days_of_schedule:
        theme = Theme_of_day.objects.filter(day_of_schedule__day_id=day_of_schedule.day.id)
        if theme:
            journal_days.append({
                'id': day_of_schedule.id,
                'day': day_of_schedule.day.day,
                'describe': theme[0].describe
            })
        else:
            journal_days.append({
                'id': day_of_schedule.id,
                'day': day_of_schedule.day.day,
                'describe': ''
            })

    themes = Theme_of_day.objects.filter()
    table = []
    for student in students:
        journal = {}
        journal['student'] = student
        journal['marks'] = []
        for day_of_schedule in days_of_schedule:
            theme = Theme_of_day.objects.filter(day_of_schedule=day_of_schedule)
            marks = Assessment.objects.filter(student=student, theme_of_day=theme)
            if marks:
                marks_of_day = [int(mark.mark) for mark in marks]
                journal['marks'].append((day_of_schedule.id, marks_of_day,))
            else:
                journal['marks'].append( (day_of_schedule.id, '',) )
        table.append(journal)
    return render_to_response('journal/journal.html', locals(), context_instance=RequestContext(request))


def add_mark(request, group, discipline, id_day, id_student, mark):
    """
     Добавление оценки
    """
    if request.method == 'GET':
        id_student, id_day, mark = int(id_student), int(id_day), int(mark),
        schedule_day = get_object_or_404(Schedule, pk=id_day)
        theme, created = Theme_of_day.objects.get_or_create(day_of_schedule=schedule_day, defaults = {'describe': ''})
        student = get_object_or_404(Students, pk=id_student)
        if mark != "0":
            assessment = Assessment(mark = mark, student = student, theme_of_day = theme)
            assessment.save()
            return HttpResponse(mark)
        else:
            Assessment.objects.filter(student = student, theme_of_day = theme).delete()
            return HttpResponse("")
    else:
        return HttpResponse("")


def teachers(request):
    if Teachers.objects.filter(id = request.user.pk):
        return HttpResponseRedirect(reverse('groups', kwargs = {'teacher': request.user.pk}))
    else:
        teachers = Teachers.objects.all()
        return render_to_response('journal/teachers.html', locals(), context_instance=RequestContext(request))


def groups(request, teacher):
    teacher = Teachers.objects.get(id = teacher)
    if isinstance(teacher, Teachers):
        groups = teacher.get_groups()
    else:
        groups = Groups.objects.all()
    return render_to_response('journal/groups.html', locals(), context_instance=RequestContext(request))


def disciplines(request, teacher, group):
    teacher = Teachers.objects.get(id=teacher)
    id_group = group
    disciplines = teacher.get_disciplines_current_group(group)
    return render_to_response('journal/disciplines.html', locals(), context_instance=RequestContext(request))

def select_discipline(request, id_group, id_discpiline):
    """
    Журнал по выбранной предмету
    ###
    брать дисциплины указанной группы из тариффикации?
    """
    discipline = Discipline.objects.all()[0]
    return render_to_response('journal/journal.html', locals(), context_instance=RequestContext(request))



from django.views.decorators.csrf import csrf_protect
@csrf_protect
def add_theme_of_day(request, group, discipline, day):
    """
    Добавляем тему выбранного дня
    """

    if Schedule.objects.filter(day=day):
        print 'HAHA'



    response = request.POST['describe']
    return HttpResponse(response)
