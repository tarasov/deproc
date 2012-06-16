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
    form_lab = ThemeForm(label_suffix='')

    discipline = Discipline.objects.get(id=discipline)
    teacher = Teachers.objects.get(id=teacher)
    group = Groups.objects.get(id=group)
    group_stud = Groups_stud.objects.get(group_id=group)
    days_of_schedule = Schedule.objects.filter(
                        plan__teacher = teacher,
                        plan__group_plan__group = group
                    ).order_by('day')[:10]
    students = group_stud.student.all()
    journal_days = []
    for day_of_schedule in days_of_schedule:
        theme = Theme_of_day.objects.filter(day_of_schedule=day_of_schedule)
        if theme:
            journal_days.append({
                'id': day_of_schedule.id,
                'day': day_of_schedule.day.day,
                'count_hours': day_of_schedule.count_hours,
                'shor_name': day_of_schedule.plan.type_hours.name,
                'num_less': day_of_schedule.num_less,
                'describe': theme[0].describe
            })
        else:
            journal_days.append({
                'id': day_of_schedule.id,
                'day': day_of_schedule.day.day,
                'count_hours': day_of_schedule.count_hours,
                'num_less': day_of_schedule.num_less,
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
                journal['marks'].append((day_of_schedule.id, '',))
        table.append(journal)
    return render_to_response('journal/journal.html', locals(), context_instance=RequestContext(request))


def add_mark(request, day, student, mark):
    if request.method == 'GET':
        student, day, mark = int(student), int(day), int(mark),
        schedule_day = get_object_or_404(Schedule, pk=day)
        theme, created = Theme_of_day.objects.get_or_create(day_of_schedule=schedule_day, defaults = {'describe': ''})
        student = get_object_or_404(Students, pk=student)
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
    if request.user.is_authenticated() and Teachers.objects.filter(id = request.user.pk):
        return HttpResponseRedirect(reverse('groups', kwargs = {'teacher': request.user.pk}))
    teachers = Teachers.objects.all()
    return render_to_response('journal/teachers.html', locals(), context_instance=RequestContext(request))


def groups(request, teacher):
    if request.GET.get('err') == '1':
        warning = True
        message = 'В выбранной группе еще нету студентов'

    teacher = Teachers.objects.get(id = teacher)
    if isinstance(teacher, Teachers):
        groups = teacher.get_groups()
    else:
        groups = Groups.objects.all()
    return render_to_response('journal/groups.html', locals(), context_instance=RequestContext(request))


def disciplines(request, teacher, group):
    if not Groups_stud.objects.filter(group_id = group):
        return HttpResponseRedirect(reverse('groups', kwargs={'teacher': teacher}) + '?err=1')

    teacher = Teachers.objects.get(id=teacher)
    group = Groups.objects.get(id=group)
    disciplines = teacher.get_disciplines_current_group(group.id)
    return render_to_response('journal/disciplines.html', locals(), context_instance=RequestContext(request))


from django.views.decorators.csrf import csrf_protect
@csrf_protect
def add_theme_of_day(request, day_of_schedule):
    """
    Добавляем тему выбранного дня
    """
    describe = request.POST['describe']
    day_of_schedule = Schedule.objects.get(id=day_of_schedule)

    themes_of_day = Theme_of_day.objects.filter(day_of_schedule = day_of_schedule)
    if themes_of_day:
        themes_of_day.delete()

    Theme_of_day(day_of_schedule = day_of_schedule, describe = describe).save()

    return HttpResponse(describe)
