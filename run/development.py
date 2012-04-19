# -*- coding: utf-8 -*-
from deproc.settings import MIDDLEWARE_CLASSES, INSTALLED_APPS, TEMPLATE_CONTEXT_PROCESSORS

INTERNAL_IPS = ('127.0.0.1',)

TEMPLATE_CONTEXT_PROCESSORS +=('django.core.context_processors.debug',)

ENABLED_TOOLBAR = True

if ENABLED_TOOLBAR:
    MIDDLEWARE_CLASSES += ('debug_toolbar.middleware.DebugToolbarMiddleware',)
    INSTALLED_APPS += ('lib.debug_toolbar',)
    DEBUG_TOOLBAR_PANELS = (
        'debug_toolbar.panels.version.VersionDebugPanel',
        'debug_toolbar.panels.timer.TimerDebugPanel',
        'debug_toolbar.panels.settings_vars.SettingsVarsDebugPanel',
        'debug_toolbar.panels.headers.HeaderDebugPanel',
        'debug_toolbar.panels.request_vars.RequestVarsDebugPanel',
        'debug_toolbar.panels.template.TemplateDebugPanel',
        'debug_toolbar.panels.sql.SQLDebugPanel',
        'debug_toolbar.panels.cache.CacheDebugPanel',
        'debug_toolbar.panels.logger.LoggingPanel',
        )
    DEBUG_TOOLBAR_CONFIG = {
        'EXCLUDE_URLS': ('/admin',),
        'INTERCEPT_REDIRECTS': False,
        }
