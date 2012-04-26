# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Types_themes'
        db.create_table('journal_types_themes', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=150)),
        ))
        db.send_create_signal('journal', ['Types_themes'])

        # Adding model 'Themes'
        db.create_table('journal_themes', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('describe', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('tariffication', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['main.Tariffication'])),
            ('type', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['journal.Types_themes'])),
            ('date_pub', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
        ))
        db.send_create_signal('journal', ['Themes'])

        # Adding model 'Assessment'
        db.create_table('journal_assessment', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('mark', self.gf('django.db.models.fields.IntegerField')()),
            ('student', self.gf('django.db.models.fields.IntegerField')()),
            ('theme', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['journal.Themes'])),
            ('date_pub', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
        ))
        db.send_create_signal('journal', ['Assessment'])

    def backwards(self, orm):
        # Deleting model 'Types_themes'
        db.delete_table('journal_types_themes')

        # Deleting model 'Themes'
        db.delete_table('journal_themes')

        # Deleting model 'Assessment'
        db.delete_table('journal_assessment')

    models = {
        'journal.assessment': {
            'Meta': {'object_name': 'Assessment'},
            'date_pub': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'mark': ('django.db.models.fields.IntegerField', [], {}),
            'student': ('django.db.models.fields.IntegerField', [], {}),
            'theme': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['journal.Themes']"})
        },
        'journal.themes': {
            'Meta': {'object_name': 'Themes'},
            'date_pub': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'describe': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'tariffication': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Tariffication']"}),
            'type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['journal.Types_themes']"})
        },
        'journal.types_themes': {
            'Meta': {'object_name': 'Types_themes'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '150'})
        },
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
            'name': ('django.db.models.fields.IntegerField', [], {'unique': 'True', 'max_length': '100'}),
            'semestr': ('django.db.models.fields.CharField', [], {'default': "('1, 2', '1, 2')", 'max_length': '6'}),
            'spec': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Speciality']"})
        },
        'main.groups_plan': {
            'Meta': {'object_name': 'Groups_plan'},
            'course': ('django.db.models.fields.IntegerField', [], {'default': '1'}),
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
        }
    }

    complete_apps = ['journal']