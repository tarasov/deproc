# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response, get_object_or_404
from django.http import HttpResponseRedirect, HttpResponse
from django.template.context import RequestContext
from deproc.journal.models import Assessment, Themes
from deproc.journal.forms import ThemeForm
from deproc.tariffication.models import Groups, Profile, Groups_stud, Discipline, Tariffication, Groups_plan, User, Teachers

def group(request, id_group, id_discipline):
    """
    журнал для группы
    """
    
    form_lab = ThemeForm(label_suffix='')

    current_group = get_object_or_404(Groups, pk=id_group)
    current_discipline = get_object_or_404(Discipline, pk=id_discipline)

    students_group = Groups_stud.objects.filter(
        group=current_group,


    )
    # сделать фильтр, типа
    # .filter(
    #   'tariffication__uch_plan_hour__uch_plan__disc = current_discipline,

    # )
    themes = Themes.objects.all()
    table = ()
    for student_group in students_group:
        marks = Assessment.objects.filter(student=student_group.student).order_by('theme')
        tr = ((Profile.objects.get(pk=student_group.student).pk, Profile.objects.get(pk=student_group.student).__unicode__(), ), )
        marks_themes = [(mark.theme.pk, mark.mark) for mark in marks]
        # оценок нету у студента
        if not marks_themes:
            tr += tuple(((i+1, 0) for i in xrange(len(themes))))
            table += (tr, )
            break

        for theme in themes:
            if theme.pk in dict(marks_themes).keys():
                tr += ((theme.pk, dict(marks_themes)[theme.pk]), )
            else:
                tr += ((theme.pk, 0), )

        table += (tr, )
    return render_to_response('journal/group.html', locals(), context_instance=RequestContext(request))

def mark_add(request, student, theme, mark):
    """
     Добавление оценки
    """
    if request.method == 'GET':
        student, theme_pk, mark = int(student), int(theme), int(mark),
        theme = Themes.objects.get(pk=theme_pk)
        Assessment.objects.filter(student=student, theme=theme).delete()
        if mark != "0":
            assessments = Assessment(mark=mark, student=student, theme=theme)
            assessments.save()
            return HttpResponse(mark)
        else:
            Assessment.objects.filter(student=student, theme=theme).delete()
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
    return render_to_response('journal/group.html', locals(), context_instance=RequestContext(request))
