# Generated by Django 2.2 on 2019-04-24 19:38

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Employee',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('emp_fname', models.CharField(max_length=255)),
                ('emp_lname', models.CharField(max_length=255)),
                ('emp_phone', models.CharField(max_length=10)),
                ('emp_address', models.EmailField(max_length=255)),
                ('type', models.CharField(choices=[('01', 'weavers'), ('02', 'supervisors'), ('03', 'engineer')], default='01', max_length=3)),
                ('emp_salary', models.DecimalField(decimal_places=2, max_digits=8)),
            ],
        ),
        migrations.CreateModel(
            name='Maintenance',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('datetime', models.DateField()),
                ('state', models.CharField(choices=[('01', 'Pending'), ('02', 'Inprogress'), ('03', 'Succeed')], default='01', max_length=3)),
                ('employee', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='reports.Employee')),
            ],
        ),
    ]
