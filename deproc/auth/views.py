
#-*- coding: utf-8 -*-

from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from financetimes.apps.account.models import User
from financetimes.apps.forms import UserProfileForm, UserAuthForm
from django.template import RequestContext
from financetimes.views import account_processor, menu_processor

def logoutUser(request):
    ''' Выход из системы '''

    drop_user_session(request)
    return HttpResponseRedirect('/')


def drop_user_session(request):
    ''' Разрушение сессии пользователя и объекта user '''
    print "drop session"
    #if hasattr(request, 'User'):
    #    del(request.User)
    if 'id' in request.session:
        del(request.session['id'])


def create_user_session(request, usr):
    ''' Создание сессии пользователя '''
    print "create session"
    drop_user_session(request)
    request.session['id'] = usr.id
    request.User = usr

    print "!!!", request.User, request.session['id']



def loginUser(request):
    # работа с данными формы

    form = UserAuthForm()

    if request.method == 'POST':
        #form = UserAuthForm(request.POST)

        # проверка данных

        if 'email' in request.POST and request.POST['email']:
            if 'password' in request.POST and request.POST['password']:
                email = request.POST['email']
                password = request.POST['password']
                print
                try:
                    # выбор пользователя
                    user = User.objects.get(email = email)
                    if user.password == password:
                        # создание сессии
                        create_user_session(request, user)
                        return HttpResponseRedirect('/')
                    else:
                        error = "login or password is bad"
                except:
                    return render_to_response("login.html", {"form": form}, context_instance = RequestContext(request, processors = [account_processor, menu_processor,]))
            return HttpResponseRedirect('/')
        else:
            return render_to_response("login.html")

    # генерация формы
    return render_to_response("login.html", {"form": form}, context_instance = RequestContext(request, processors = [account_processor, menu_processor,]))


def regUser(request):

    # работа с данными формы

    if request.method == 'POST':

        form = UserProfileForm(request.POST)

        # проверка данных
        if form.is_valid():

            try:
                # запись данных в БД
                new_user = form.save()
                # создание сессии
                create_user_session(request, new_user)
            except:
                return render_to_response("registration.html", {"form": form, "error": "ERROR"}, context_instance = RequestContext(request, processors = [account_processor, menu_processor,]))
            return HttpResponseRedirect('/')
        else:
            return render_to_response("registration.html", {"form": form, "error": form.errors}, context_instance = RequestContext(request, processors = [account_processor, menu_processor,]))

    # генерация формы
    else:
        form = UserProfileForm()
    return render_to_response("registration.html", {"form": form}, context_instance = RequestContext(request, processors = [account_processor, menu_processor,]))
