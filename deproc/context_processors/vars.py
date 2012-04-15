# -*- coding: utf-8 -*-
from deproc.main.views import pages_list

__author__ = 'tarasov'

def menu_vars(request):
    # создаем (ссылка, название)
    pages = [(page[0], page[1][1]) for page in pages_list.items()]
    return {
        'pages': pages,
        }

