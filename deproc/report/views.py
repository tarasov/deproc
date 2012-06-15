from collections import defaultdict
import json
from django.contrib.auth.models import User
from django.db.models.aggregates import Sum
from django.http import HttpResponse
from django.shortcuts import render_to_response, get_object_or_404
from django.template.context import RequestContext
from deproc.schedule.models import Schedule
from deproc.tariffication import models as tar_models
from deproc.schedule import models as sch_models
from deproc.tariffication.models import Teachers, Tariffication

def report_all(request):
    teachers = tar_models.Teachers.objects.all()
    return render_to_response('report/teachers.html', locals(), context_instance=RequestContext(request))

def select(request, tch = None):
    teacherID = None
    report = {}

    if 'teacher' in request.POST:
        teacherID = request.POST['teacher']
    elif tch:
        teacherID = tch

    if teacherID:
        try:
            teacher = get_object_or_404(User, pk = teacherID)
        except Exception:
            pass
        else:
            teacher = Teachers.objects.get(pk = teacherID)
            teacher_full_name = '%s %s %s' % (teacher.last_name, teacher.first_name, teacher.other_name)

            tariffs = Tariffication.objects.filter(
                teacher = teacher,
            ).order_by(
                'group_plan__group',
                'uch_plan_hour__uch_plan__disc',
                'uch_plan_hour__type_hour'
            ).select_related()

            reports = {}
            for i, tariff in enumerate(tariffs):

                reports[i] = {}

                vsego = Tariffication.objects.get(
                    pk = tariff.pk
                ).uch_plan_hour.count_hours

                vidano = Schedule.objects.filter(
                    plan = tariff
                ).aggregate(count=Sum('count_hours'))
                if not vidano['count']:
                    vidano['count'] = 0

                reports[i]['group'] = tariff.group_plan.group.name
                reports[i]['disc'] = tariff.disc.name
                reports[i]['type'] = tariff.uch_plan_hour.type_hour.name
                reports[i]['vidano'] = vidano['count']
                reports[i]['vsego'] = vsego
                if vsego != 0:
                    reports[i]['procent'] = vidano['count']*100/vsego

            report = defaultdict(dict)
            for i, item in reports.items():
                type = defaultdict(dict)
                copy = item.copy()
                tp = item.copy()
                tp.pop('group')
                tp.pop('disc')
                type[(tp.pop('type'))].update(tp)
#                print tp
                report[(copy.pop('group'), copy.pop('disc'))].update(type)

            report = dict(report)

    if tch:
        reports = report
        new_reports = {}
        for key,value in reports.items():
            group, discipline = key
            new_reports['%s_%s' % (group, discipline)] = value

        return HttpResponse(json.dumps(new_reports))
    else:
        return render_to_response('report/select.html', locals(), context_instance=RequestContext(request))