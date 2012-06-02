from django.shortcuts import render_to_response
from django.template.context import RequestContext
from deproc.tariffication import models as tar_models
from deproc.schedule import models as sch_models

def report_all(request):
    teachers = tar_models.Teachers.objects.all()
    return render_to_response('report/teachers.html', locals(), context_instance=RequestContext(request))