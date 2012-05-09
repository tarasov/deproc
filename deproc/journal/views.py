# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response, get_object_or_404
from django.http import HttpResponseRedirect, HttpResponse
from django.template.context import RequestContext
from deproc.journal.models import Assessment, Journal_day
from deproc.journal.forms import ThemeForm
from deproc.tariffication.models import Groups, Profile, Groups_stud, Discipline, Tariffication, Groups_plan, User, Teachers, Students
from deproc.schedule.models import Schedule_day

def group(request, id_group, id_discipline):
    """
    журнал для группы
    """
    form_lab = ThemeForm(label_suffix='')

    current_group = get_object_or_404(Groups, pk=id_group)
    current_discipline = get_object_or_404(Discipline, pk=id_discipline)

    group = get_object_or_404(Groups_stud, group=current_group)
    students = group.student.all()
    days = Schedule_day.objects.all()
    table = []
    for student in students:
        journal = {}
        journal['student'] = student
        journal['marks'] = []
        for day in days:
            marks = Assessment.objects.filter(student=student, day=day)
            if marks:
                marks_of_student = (day.pk, [mark for mark in marks]
                journal['marks'].append((day.pk, marks[0]))
            else:
                journal['marks'].append((day.pk, ''))

        table.append(journal)
    return render_to_response('journal/journal.html', locals(), context_instance=RequestContext(request))

def add_mark(request, group, discipline, id_day, id_student, mark):
    """
     Добавление оценки
    """
    if request.method == 'GET':
        id_student, id_day, mark = int(id_student), int(id_day), int(mark),
        day = get_object_or_404(Schedule_day, pk=id_day)
        student = get_object_or_404(Students, pk=id_student)
        Assessment.objects.filter(student=student, day=day).delete()
        if mark != "0":
            assessment = Assessment(mark = mark, student = student, day=day)
            assessment.save()
            return HttpResponse(mark)
        else:
            Assessment.objects.filter(student = student, day = day).delete()
            return HttpResponse("")
    else:
        return HttpResponse("")


def groups(request):
    """
    Список групп
    """
    user = get_object_or_404(Teachers, pk=request.user.pk)
    groups = user.groups_lessons_are_taught()
    return render_to_response('journal/groups.html', locals(), context_instance=RequestContext(request))

def disciplines(request, id_group):
    """
    Список предметов пропедавателя выбранной группы
    """
#    id_group = id_group
    disciplines = Discipline.objects.all()
    user = get_object_or_404(Teachers, pk=request.user.pk)
    disciplines = user.disciplines_lessons_are_taught(id_group)
    print disciplines
    return render_to_response('journal/disciplines.html', locals(), context_instance=RequestContext(request))

def select_discipline(request, id_group, id_discpiline):
    """
    Журнал по выбранной предмету
    ###
    брать дисциплины указанной группы из тариффикации?
    """
    discipline = Discipline.objects.all()[0]
    return render_to_response('journal/journal.html', locals(), context_instance=RequestContext(request))
