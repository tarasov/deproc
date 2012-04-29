# -*- coding: utf-8 -*-
from django.forms import ModelForm
from deproc.tariffication import models


# dynamic form for PageForm
def dynamic_form_page(model, fields = None):
    # создаем мету и создаем аттрибут модели
    class Meta: pass
    setattr(Meta, 'model', model)

    # аттрибуты класса
    attrs = {'Meta': Meta, }
    if fields:
        attrs.update(fields)

    # отдаем Модел форме мету
    name = '%sForm' % model.__name__
    return type(name, (ModelForm, ), attrs )
