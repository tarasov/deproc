# -*- coding: utf-8 -*-
# Django settings for deproc project.

DEBUG = True
TEMPLATE_DEBUG = DEBUG

import os.path
PROJECT_ROOT = os.path.normpath(os.path.dirname(__file__))
root = os.path.split(PROJECT_ROOT)[0]
ADMINS = (
    # ('Your Name', 'your_email@example.com'),
)

MANAGERS = ADMINS


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'OPTIONS': {
            'read_default_file': root + '/run/db_tarasov.conf',
            'init_command': 'SET storage_engine=INNODB',
            },
        },
#    # НАСТРОЙ СВОЮ БД в файле db_gavrilov.conf, закоменть выше и раскоменть ниже
#    'default': {
#        'ENGINE': 'django.db.backends.mysql',
#        'OPTIONS': {
#            'read_default_file': root + '/run/db_gavrilov.conf',
#            'init_command': 'SET storage_engine=INNODB',
#            },
#        },
}

TIME_ZONE = 'Europe/Moscow'
LANGUAGE_CODE = 'Ru-ru'
SITE_ID = 1
USE_I18N = True
USE_L10N = True
USE_TZ = False
support_timezone = True
MEDIA_ROOT = PROJECT_ROOT + '/media/'
MEDIA_URL = '/media/'
STATIC_ROOT = ''
STATIC_URL = '/static/'

#ADMIN_MEDIA_PREFIX = '/static/admin/'

STATICFILES_DIRS = (
    #
)

STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
#    'django.contrib.staticfiles.finders.DefaultStorageFinder',
)

SECRET_KEY = '&amp;-v-689*-=aq3x%(!1oq@f&amp;z=^tj(#pzmgt(f!b)5&amp;!jyvlv9@'

TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
    'django.template.loaders.eggs.Loader',
)

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    # Uncomment the next line for simple clickjacking protection:
    # 'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

TEMPLATE_CONTEXT_PROCESSORS = (
    'django.contrib.auth.context_processors.auth',
    'django.core.context_processors.i18n',
    'django.core.context_processors.media',
    "django.core.context_processors.request",
    # apps
    'deproc.context_processors.vars.menu_vars',
    )


ROOT_URLCONF = 'deproc.urls'

# Python dotted path to the WSGI application used by Django's runserver.
WSGI_APPLICATION = 'deproc.wsgi.application'

TEMPLATE_DIRS = (
    PROJECT_ROOT + '/templates/',
)

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.admin',
    'south',
    'deproc.tariffication',
    'deproc.schedule',
    'deproc.journal',
)

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse'
        }
    },
    'handlers': {
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
            'class': 'django.utils.log.AdminEmailHandler'
        }
    },
    'loggers': {
        'django.request': {
            'handlers': ['mail_admins'],
            'level': 'ERROR',
            'propagate': True,
        },
    }
}


if DEBUG:
    from run.development import *
