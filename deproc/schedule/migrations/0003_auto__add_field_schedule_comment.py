# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding field 'Schedule.comment'
        db.add_column('schedule', 'comment',
                      self.gf('django.db.models.fields.TextField')(null=True, blank=True),
                      keep_default=False)

    def backwards(self, orm):
        # Deleting field 'Schedule.comment'
        db.delete_column('schedule', 'comment')

    models = {
        'auth.group': {
            'Meta': {'object_name': 'Group'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80'}),
            'permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'})
        },
        'auth.permission': {
            'Meta': {'ordering': "('content_type__app_label', 'content_type__model', 'codename')", 'unique_together': "(('content_type', 'codename'),)", 'object_name': 'Permission'},
            'codename': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['contenttypes.ContentType']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        'auth.user': {
            'Meta': {'object_name': 'User'},
            'date_joined': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'groups': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Group']", 'symmetrical': 'False', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        },
        'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'schedule.absences': {
            'Meta': {'object_name': 'Absences', 'db_table': "'absences'"},
            'absence': ('django.db.models.fields.CharField', [], {'max_length': '10', 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'schedule': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['schedule.Schedule']"}),
            'student': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Students']"})
        },
        'schedule.classroom': {
            'Meta': {'object_name': 'Classroom', 'db_table': "'classroom'"},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'number': ('django.db.models.fields.IntegerField', [], {'max_length': '100'})
        },
        'schedule.schedule': {
            'Meta': {'object_name': 'Schedule', 'db_table': "'schedule'"},
            'classroom': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['schedule.Classroom']", 'null': 'True', 'blank': 'True'}),
            'comment': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'day': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['schedule.Schedule_day']"}),
            'hour_type': ('django.db.models.fields.IntegerField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'num_less': ('django.db.models.fields.IntegerField', [], {}),
            'plan': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Tariffication']"})
        },
        'schedule.schedule_day': {
            'Meta': {'object_name': 'Schedule_day', 'db_table': "'schedule_day'"},
            'day': ('django.db.models.fields.DateField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'real': ('django.db.models.fields.BooleanField', [], {'default': 'False'})
        },
        'schedule.schedule_empty': {
            'Meta': {'object_name': 'Schedule_empty', 'db_table': "'schedule_empty'"},
            'day': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['schedule.Schedule_day']"}),
            'group': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Groups']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'num_less': ('django.db.models.fields.IntegerField', [], {})
        },
        'schedule.schedule_filled': {
            'Meta': {'object_name': 'Schedule_filled', 'db_table': "'schedule_filled'"},
            'classroom': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['schedule.Classroom']", 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'lesson': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['schedule.Schedule_empty']"}),
            'plan': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Tariffication']", 'null': 'True', 'blank': 'True'})
        },
        'tariffication.disc_type': {
            'Meta': {'object_name': 'Disc_type', 'db_table': "'disc_type'"},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '150'})
        },
        'tariffication.discipline': {
            'Meta': {'object_name': 'Discipline', 'db_table': "'discipline'"},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '150'}),
            'short_name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Disc_type']"})
        },
        'tariffication.groups': {
            'Meta': {'ordering': "['name']", 'object_name': 'Groups', 'db_table': "'groups'"},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.IntegerField', [], {'unique': 'True', 'max_length': '100'}),
            'semestr': ('django.db.models.fields.CharField', [], {'default': "('1, 2', '1, 2')", 'max_length': '6'}),
            'spec': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Speciality']"})
        },
        'tariffication.groups_plan': {
            'Meta': {'object_name': 'Groups_plan', 'db_table': "'groups_plan'"},
            'course': ('django.db.models.fields.IntegerField', [], {'default': '1'}),
            'group': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Groups']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'year': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Year']"})
        },
        'tariffication.profile': {
            'Meta': {'object_name': 'Profile', 'db_table': "'profile'", '_ormbases': ['auth.User']},
            'b_day': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'other_name': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'phone': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'sex': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'user_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['auth.User']", 'unique': 'True', 'primary_key': 'True'})
        },
        'tariffication.speciality': {
            'Meta': {'object_name': 'Speciality', 'db_table': "'speciality'"},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '150'}),
            'num_spec': ('django.db.models.fields.FloatField', [], {'max_length': '100'})
        },
        'tariffication.students': {
            'Meta': {'object_name': 'Students', 'db_table': "'students'", '_ormbases': ['tariffication.Profile']},
            'cart': ('django.db.models.fields.IntegerField', [], {}),
            'profile_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['tariffication.Profile']", 'unique': 'True', 'primary_key': 'True'})
        },
        'tariffication.tariffication': {
            'Meta': {'object_name': 'Tariffication', 'db_table': "'tariffication'"},
            'group_plan': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'gpset'", 'to': "orm['tariffication.Groups_plan']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'teacher': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Teachers']"}),
            'uch_plan_hour': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.UchPlanHour']"})
        },
        'tariffication.teachers': {
            'Meta': {'object_name': 'Teachers', 'db_table': "'teachers'", '_ormbases': ['tariffication.Profile']},
            'cabinet': ('django.db.models.fields.IntegerField', [], {}),
            'profile_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['tariffication.Profile']", 'unique': 'True', 'primary_key': 'True'})
        },
        'tariffication.uchplan': {
            'Meta': {'object_name': 'UchPlan', 'db_table': "'uch_plan'"},
            'disc': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Discipline']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'otch': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'semestr': ('django.db.models.fields.IntegerField', [], {'max_length': '100'}),
            'spec': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Speciality']"})
        },
        'tariffication.uchplanhour': {
            'Meta': {'object_name': 'UchPlanHour', 'db_table': "'uch_plan_hour'"},
            'count_hours': ('django.db.models.fields.IntegerField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'type': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'uch_plan': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.UchPlan']", 'max_length': '100'})
        },
        'tariffication.year': {
            'Meta': {'object_name': 'Year', 'db_table': "'year'"},
            'date_begin': ('django.db.models.fields.DateField', [], {}),
            'date_end': ('django.db.models.fields.DateField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        }
    }

    complete_apps = ['schedule']