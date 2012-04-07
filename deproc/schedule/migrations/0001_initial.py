# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):
    
    def forwards(self, orm):
        
        # Adding model 'Classroom'
        db.create_table('schedule_classroom', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('number', self.gf('django.db.models.fields.IntegerField')(max_length=100)),
        ))
        db.send_create_signal('schedule', ['Classroom'])

        # Adding model 'Schedule_day'
        db.create_table('schedule_schedule_day', (
            ('real', self.gf('django.db.models.fields.BooleanField')(default=False, blank=True)),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('day', self.gf('django.db.models.fields.DateField')(max_length=100, null=True, blank=True)),
        ))
        db.send_create_signal('schedule', ['Schedule_day'])

        # Adding model 'Schedule'
        db.create_table('schedule_schedule', (
            ('classroom', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['schedule.Classroom'])),
            ('num_less', self.gf('django.db.models.fields.IntegerField')()),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('day', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['schedule.Schedule_day'])),
            ('plan', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['main.Tariffication'])),
        ))
        db.send_create_signal('schedule', ['Schedule'])

        # Adding model 'Absences'
        db.create_table('schedule_absences', (
            ('absence', self.gf('django.db.models.fields.CharField')(max_length=10, null=True, blank=True)),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('student', self.gf('django.db.models.fields.CharField')(max_length=100, null=True, blank=True)),
            ('schedule', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['schedule.Schedule'])),
        ))
        db.send_create_signal('schedule', ['Absences'])
    
    
    def backwards(self, orm):
        
        # Deleting model 'Classroom'
        db.delete_table('schedule_classroom')

        # Deleting model 'Schedule_day'
        db.delete_table('schedule_schedule_day')

        # Deleting model 'Schedule'
        db.delete_table('schedule_schedule')

        # Deleting model 'Absences'
        db.delete_table('schedule_absences')
    
    
    models = {
        'main.disc_type': {
            'Meta': {'object_name': 'Disc_type'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '150'})
        },
        'main.discipline': {
            'Meta': {'object_name': 'Discipline'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '150'}),
            'short_name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Disc_type']"})
        },
        'main.groups': {
            'Meta': {'object_name': 'Groups'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.IntegerField', [], {'max_length': '100'}),
            'spec': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Speciality']"})
        },
        'main.groups_plan': {
            'Meta': {'object_name': 'Groups_plan'},
            'group': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Groups']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'year': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Year']"})
        },
        'main.speciality': {
            'Meta': {'object_name': 'Speciality'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '150'}),
            'num_spec': ('django.db.models.fields.FloatField', [], {'max_length': '100'})
        },
        'main.tariffication': {
            'Meta': {'object_name': 'Tariffication'},
            'group_plan': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Groups_plan']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'teacher': ('django.db.models.fields.IntegerField', [], {'max_length': '100'}),
            'uch_plan_hour': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.UchPlanHour']"})
        },
        'main.uchplan': {
            'Meta': {'object_name': 'UchPlan'},
            'disc': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Discipline']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'otch': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'semestr': ('django.db.models.fields.IntegerField', [], {'max_length': '100'}),
            'spec': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Speciality']"})
        },
        'main.uchplanhour': {
            'Meta': {'object_name': 'UchPlanHour'},
            'count_hours': ('django.db.models.fields.IntegerField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'type': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'uch_plan': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.UchPlan']", 'max_length': '100'})
        },
        'main.year': {
            'Meta': {'object_name': 'Year'},
            'date_begin': ('django.db.models.fields.DateField', [], {}),
            'date_end': ('django.db.models.fields.DateField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        },
        'schedule.absences': {
            'Meta': {'object_name': 'Absences'},
            'absence': ('django.db.models.fields.CharField', [], {'max_length': '10', 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'schedule': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['schedule.Schedule']"}),
            'student': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'})
        },
        'schedule.classroom': {
            'Meta': {'object_name': 'Classroom'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'number': ('django.db.models.fields.IntegerField', [], {'max_length': '100'})
        },
        'schedule.schedule': {
            'Meta': {'object_name': 'Schedule'},
            'classroom': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['schedule.Classroom']"}),
            'day': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['schedule.Schedule_day']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'num_less': ('django.db.models.fields.IntegerField', [], {}),
            'plan': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Tariffication']"})
        },
        'schedule.schedule_day': {
            'Meta': {'object_name': 'Schedule_day'},
            'day': ('django.db.models.fields.DateField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'real': ('django.db.models.fields.BooleanField', [], {'default': 'False', 'blank': 'True'})
        }
    }
    
    complete_apps = ['schedule']
