# -*- coding: utf-8 -*-
from django.shortcuts import render_to_response
from django.http import HttpResponseRedirect, HttpResponse
from django.template.context import RequestContext
from deproc.journal.models import Assessment, Themes
from deproc.journal.forms import ThemeForm
from deproc.main.models import Profile

def show(request):
    """
    Список студентов с оценками
    """
    
    form_lab = ThemeForm(label_suffix='')
    students = Profile().get_students()
    themes = Themes.objects.all()

    table = ()
    for student in students:
        marks = Assessment.objects.filter(student=student[0]).order_by('theme')
        tr = ((Profile.objects.get(pk=student[0]).pk, Profile.objects.get(pk=student[0]).__unicode__(), ), )
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
    return render_to_response('journal/show.html', locals(), context_instance=RequestContext(request))

def mark_add(request, student, theme, mark):
    """
     Добавление оценки
    """
    if request.method == 'GET':
        student, theme_pk, mark = int(student), int(theme), int(mark),
        theme = Themes.objects.get(pk=theme_pk)
        Assessment.objects.filter(student=student, theme=theme).delete()
        if mark != "0":
            mark = Assessment(mark=mark, student=student, theme=theme)
            mark.save()
            return HttpResponse(mark.mark)
        else:
            Assessment.objects.filter(student=student, theme=theme).delete()
            return HttpResponse("")
    else:
        return HttpResponse("")




