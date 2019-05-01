from django.contrib.auth.models import User, Group
from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from .forms import RegisterModelForm


def index(request):
    maintenance_list = [
        {'id': 1},
        {'id': 2}
    ]

    context = {
        'page_title': 'MaintenanceList',
        'maintenance_list': maintenance_list
    }

    return render(request, template_name='reports/index.html', context= context)


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
