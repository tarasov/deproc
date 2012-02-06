# -*- coding: utf-8 -*-
import logging
from django.shortcuts import render_to_response
from django.http import HttpResponseRedirect, HttpResponseServerError, HttpResponse, HttpResponseNotFound
from django.template import RequestContext
from django.core.urlresolvers import reverse

def wellcome(request):
    return render_to_response('tariffication/index.html', locals(), context_instance=RequestContext(request))