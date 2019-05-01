import datetime

from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User, Group
from django.forms import formset_factory
from django.http import HttpResponse
from django.shortcuts import render, redirect

# Create your views here.
from .models import Maintenance
from .forms import RegisterModelForm, ReportModelForm


def index(request):
    data = []
    context = {}
    print(request.user)
    test = Maintenance.objects
    for detail in test.all():
        data.append(
            {
                'machine': detail.machine,
                'datetime': detail.datetime,
                'state': detail.state,
                'desc': detail.desc
            }
        )
    # MaintenanceFormSet = formset_factory(ReportModelForm, max_num=len(data))
    # formset = MaintenanceFormSet(initial=data)
    formset = data
    print(data)
    context['formset'] = formset

    return render(request, template_name='reports/index.html', context= context)

def my_login(request):
    context = {}
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)
        if user:
            login(request, user)
            next_url = request.POST.get('next_url')
            if next_url:
                return redirect(next_url)

        else:
            context['username'] = username
            context['password'] = password
            context['error'] = 'Wrong Username or Passsword'
    next_url = request.GET.get('next')
    if next_url:
        context['next_url'] = next_url
    return render(request, 'reports/login.html', context)

def my_register(request):
    if request.method == 'POST':
        form = RegisterModelForm(request.POST)
        if form.is_valid():
            user = User.objects.create_user(
                username = form.cleaned_data.get('user'),
                password = form.cleaned_data.get('password'),
                first_name = form.cleaned_data.get('emp_fname'),
                last_name = form.cleaned_data.get('emp_lname'),
                email = form.cleaned_data.get('emp_email')

            )
            user.save()
            if form.cleaned_data.get('type') == '01':
                group = Group.objects.get(name='weavers')
                user.groups.add(group)

            if form.cleaned_data.get('type') == '02':
                group = Group.objects.get(name='supervisors')
                user.groups.add(group)

            if form.cleaned_data.get('type') == '03':
                group = Group.objects.get(name='engineer')
                user.groups.add(group)

            check = form.save(commit=False)
            check.employee_id = user.id
            form.save()

    form = RegisterModelForm()
    context = {'form': form}
    return render(request,'reports/register.html', context=context)

def report_form(request):
    if request.method == 'POST':
        form = ReportModelForm(request.POST)
        if form.is_valid():
            print("test")
            check = form.save(commit=False)
            check.datetime = datetime.datetime.today()
            check.employee_id = request.user.id
            form.save()
            return redirect('index')

    print(datetime.date.today())
    print(request.user.id)
    form = ReportModelForm()
    context = {'form': form}
    return render(request,'reports/reportform.html', context=context)
