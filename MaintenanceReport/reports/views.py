import datetime

from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth.models import User, Group
from django.db import models
from django.forms import formset_factory
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, redirect, render_to_response
from graphos.renderers import gchart
from graphos.sources.model import ModelDataSource

from .models import Maintenance, Category, Category_Part, Part, Cart, Order, Machine_Category, Machine, Employee
from .forms import RegisterModelForm, ReportModelForm, ReportForm, DateSelectForm

def group_required(*group_names):
    def in_groups(u):
        if u.is_authenticated:
            if bool(u.groups.filter(name__in=group_names)) | u.is_superuser:
                return True
        return False
    return user_passes_test(in_groups, login_url='login')


@login_required
def index(request):
    data = []
    context = {'title': "รายการแจ้งซ่อม",}
    print(request.user)
    if request.method == 'POST':
        check = request.POST.get('check')
        if check == 'all':
            test = Maintenance.objects.all().order_by('-datetime')
        elif check == 'pending':
            test = Maintenance.objects.filter(state='Pending').order_by('datetime')
        elif check == 'inprogress':
            test = Maintenance.objects.filter(state='Inprogress').order_by('datetime')
        elif check == 'succeed':
            test = Maintenance.objects.filter(state='Succeed').order_by('-datetime')
    else:
        test = Maintenance.objects.all().order_by('-datetime')
    for detail in test.all():
        emp = Employee.objects.get(pk = detail.employee_id)
        emp_fname = emp.emp_fname
        emp_lname = emp.emp_lname
        emp_name = emp_fname + " " + emp_lname
        print("name is %s" %(emp_name))
        data.append(
            {
                'id': detail.id,
                'machine': detail.machine,
                'datetime': detail.datetime,
                'state': detail.state,
                'desc': detail.desc,
                'emp_name' : emp_name
            }
        )
    # MaintenanceFormSet = formset_factory(ReportModelForm, max_num=len(data))
    # formset = MaintenanceFormSet(initial=data)
    formset = data
    print(data)
    context['formset'] = formset

    return render(request, template_name='reports/index.html', context= context)

def my_login(request):
    context = {'title': "เข้าสู่ระบบ",}
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = authenticate(request, username=username, password=password)
        if user:
            login(request, user)
            next_url = request.POST.get('next_url')
            if next_url:
                print('conneting')
                return redirect(next_url)
            else:
                return redirect('index')

        else:
            context['username'] = username
            context['password'] = password
            context['error'] = 'Wrong Username or Passsword'
    next_url = request.GET.get('next')
    if next_url:
        context['next_url'] = next_url
    return render(request, 'reports/login.html', context)

@login_required
def my_register(request):
    context = {}
    if request.method == 'POST':
        form = RegisterModelForm(request.POST)
        if form.is_valid():
            try:
                user = User.objects.get(username=form.cleaned_data.get('user'))
                context['usererror'] = 'ชื่อผู้ใช้งานนี้มีในระบบแล้ว'
            except User.DoesNotExist:
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
                return redirect('index')
    else:
        form = RegisterModelForm()
    context['title'] = 'สมัตรสมาชิค'
    context['form'] = form
    return render(request,'reports/register.html', context=context)

@login_required
def report_form(request):
    if request.method == 'POST':
        form = ReportModelForm(request.POST)
        # name =
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
    context = {'title': "แจ้งซ่อมปุกรณ์",'form': form}
    return render(request,'reports/reportform.html', context=context)

@login_required
@group_required('engineer')
def detail(request, maintenance_id):
    context = {'title': "รายละเอียดการแจ้งซ่อม",}
    detail = Maintenance.objects.get(pk=maintenance_id)

    data = [{
                'id': detail.id,
                'machine': detail.machine,
                'datetime': detail.datetime,
                'state': detail.state,
                'desc': detail.desc,
            }]
    ReportFormSet = formset_factory(ReportForm, max_num=len(data))
    if request.method == 'POST':
        formset = ReportFormSet(request.POST)
        if formset.is_valid():
            for report_form in formset:
                report = Maintenance.objects.get(id=report_form.cleaned_data.get('id'))
                if report:
                    report.state = report_form.cleaned_data.get('state')
                    report.save()
                    return redirect('index')
    else:
        formset = ReportFormSet(initial=data)
    context['maintenance'] = data
    context['formset'] = formset
    return render(request, 'reports/detail.html', context=context)

@login_required
def my_logout(request):
    logout(request)
    return  redirect('login')

@login_required
@group_required('engineer')
def stock_list(request, category_id, machine_id):
    data_stock = []
    object_list = Category.objects.filter(id=category_id)
    if request.method == 'POST':
        print('check')
        # searchpart = []
        searchpart = request.POST.get('searchpart')
        print(searchpart)
        for stock in object_list:
            category_part = Category_Part.objects.filter(c=stock.id)
            for part_list in category_part:
                part = Part.objects.filter(id=part_list.p_id, part_desc__icontains= searchpart)
                print(part)
                for detail in part:
                    data_stock.append({
                        'c_name': stock.c_name,
                        'p_id': part_list.p_id,
                        'part_code': detail.part_code,
                        'cost': detail.cost,
                        'part_desc': detail.part_desc,
                        'stock': detail.stock,
                        'minimum_stock': detail.minimum_stock
                    })
    else:
        for stock in object_list:
            category_part = Category_Part.objects.filter(c=stock.id)
            searchpart = []
            for part_list in category_part:
                part = Part.objects.filter(id=part_list.p_id)
                print(part)
                for detail in part:
                    data_stock.append({
                        'c_name': stock.c_name,
                        'p_id': part_list.p_id,
                        'part_code': detail.part_code,
                        'cost': detail.cost,
                        'part_desc': detail.part_desc,
                        'stock': detail.stock,
                        'minimum_stock': detail.minimum_stock
                    })
    context = {
        'stock_part': data_stock,
        'stock_list': object_list,
        'category_id': category_id,
        'machine_id': machine_id,
        'text': searchpart
    }

    return render(request, template_name='reports/stock/stockpick.html', context=context)

@login_required
@group_required('engineer')
def addtocart(request, part_id, machine_id):
    part = Part.objects.get(id=part_id)
    part_stock = part.stock
    if part_stock > 0:
        part.stock = part_stock-1
        try:
            cart = Cart.objects.get(part_id=part_id, for_machine_id=machine_id)
            print(cart)
            cart.quantity = cart.quantity+1
            cart.save()

        except Cart.DoesNotExist:
            print("NONONO")
            Cart.objects.create(
                employee_id=request.user.id,
                part_id=part_id,
                quantity=1,
                for_machine_id=machine_id
            )
    else:
        print('OUT OF STOCK')
    part.save()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER', '/'))
    # return redirect('stockpick')

@login_required
@group_required('engineer')
def cart(request, category_id, machine_id):
    data = []
    total_cost = 0
    cart = Cart.objects.filter(employee_id=request.user.id)
    for item in cart:
        part = Part.objects.get(pk=item.part_id)
        machine = Machine.objects.get(pk=item.for_machine_id)
        total_cost = total_cost + (int(part.cost)*item.quantity)
        print(total_cost)
        data.append({
            'quantity':item.quantity,
            'employee_id':request.user.id,
            'part_id':item.part_id,
            'part_code':part.part_code,
            'cost_one':part.cost,
            'cost_total': int(part.cost)*item.quantity,
            'total_cost': total_cost,
            'for_machine_name': machine.mac_name,
            'for_machine_id': item.for_machine_id
        })
    if request.method == 'POST':
        cart_list = Cart.objects.filter(employee_id=request.user.id)
        for item in cart_list:
            Order.objects.create(
                quantity=item.quantity,
                datetime=datetime.datetime.today(),
                employee_id=request.user.id,
                part_id=item.part_id,
                for_machine_id=item.for_machine_id
            )
        cart_list.delete()
        return redirect('index')

    context = {
        'item_list': data,
        'category_id': category_id,
        'machine_id': machine_id
    }
    return render(request, template_name='reports/stock/cart.html', context=context)

@login_required
@group_required('engineer')
def additem(request, part_id, employee_id, for_machine_id):
    part = Part.objects.get(id=part_id)
    print(part)
    if(part.stock > 0):
        part.stock = part.stock-1
        part.save()
        cart = Cart.objects.get(part_id=part_id, employee_id=employee_id, for_machine_id=for_machine_id)
        cart.quantity = cart.quantity+1
        cart.save()

    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

@login_required
@group_required('engineer')
def decreaseitem(request, part_id, employee_id, for_machine_id):
    part = Part.objects.get(id=part_id)
    print(part)
    cart = Cart.objects.get(part_id=part_id, employee_id=employee_id, for_machine_id=for_machine_id)
    if(cart.quantity == 1):
        cart.delete()
    else:
        part.stock = part.stock+1
        part.save()
        cart.quantity = cart.quantity-1
        cart.save()

    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

@login_required
@group_required('engineer')
def deleteitem(request, part_id, for_machine_id):
    cart = Cart.objects.get(part_id=part_id, for_machine_id=for_machine_id)
    part = Part.objects.get(id=part_id)
    part.stock = part.stock+cart.quantity
    part.save()
    cart.delete()

    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    # return redirect('cart')

@login_required
@group_required('engineer')
def selectcategory(request, machine_id):
    data = []
    machine = Machine_Category.objects.filter(machine_id=machine_id)
    print(machine)
    if request.method == 'POST':
        print('check')
        searchcat = request.POST.get('searchcat')
        print(searchcat)
        for category_list in machine:
            category = Category.objects.filter(id=category_list.category_id, c_name__icontains=searchcat)
            machine_name = Machine.objects.get(pk=machine_id)
            title = "อะไหล่อุปกรณ์ " + str(machine_name)
            for item in category:
                data.append({
                    'id': item.id,
                    'c_code': item.c_code,
                    'c_name': item.c_name,
                    'image': item.image
                })
    else:
        for category_list in machine:
            category = Category.objects.filter(id=category_list.category_id)
            machine_name = Machine.objects.get(pk=machine_id)
            title = "อะไหล่อุปกรณ์ " + str(machine_name)
            searchcat = []
            for item in category:
                data.append({
                    'id': item.id,
                    'c_code': item.c_code,
                    'c_name': item.c_name,
                    'image': item.image
                })
    context = {
        'title': title,
        'category': data,
        'machine_id': machine_id,
        'text': searchcat
    }
    print("name %s" %title)
    return render(request, template_name='reports/stock/selectcategory.html', context=context)

@login_required
@group_required('engineer')
def selectmachine(request):
    if request.method == 'POST':
        print('check')
        searchmac = request.POST.get('searchmac')
        print(searchmac)
        machine = Machine.objects.filter(mac_name__icontains=searchmac)
    else:
        machine = Machine.objects.all()
    context = {
        'title': "รายการเครื่องจักรทอผ้า",
        'machine_list': machine
    }
    return render(request, template_name='reports/stock/selectmachine.html', context=context)

@login_required
@group_required('engineer', 'supervisors')
def graph(request):
    data = []
    machinedataset = []
    if request.method == 'POST':
        form = DateSelectForm(request.POST)
        if form.is_valid():
            prev = form.cleaned_data.get('start_date')
            now = form.cleaned_data.get('end_date')
    else:
        form = DateSelectForm()
        prev = datetime.date.today().replace(day=1)
        now = datetime.date.today() + datetime.timedelta(days=1)
    order = Order.objects.filter(datetime__gte=prev, datetime__lte=now).values('part_id').annotate(models.Sum('quantity')).order_by('-quantity__sum')
    maintenance = Maintenance.objects.filter(datetime__gte=prev, datetime__lte=now).values('machine_id').annotate(check=models.Count('machine_id'))
    print(maintenance)
    print(order)
    for item in order:
        part = Part.objects.get(pk=item['part_id'])
        data.append({
            'part_code': part.part_code,
            'part_desc': part.part_desc,
            'quantity': item['quantity__sum'],
            'part_cost': part.cost,
        })

    for item_maintenance in maintenance:
        machine = Machine.objects.get(pk=item_maintenance['machine_id'])
        machinedataset.append({
            'machine_id': item_maintenance['machine_id'],
            'machine_name': machine.mac_name,
            'check': item_maintenance['check']
        })

    print(data)
    print(machinedataset)
    context = {
        'title': 'ยอดสรุปผลการซ่อม',
        'chart':     'chart',
        'data': order,
        'datatest':data,
        'datamaintenance': machinedataset,
        'form': form}
    return render(request, template_name='reports/graph.html', context=context)

# @login_required
# def working(request):
#     data = []
#     context = {'title': "รายการแจ้งซ่อม",}
#     print(request.user)
#     test = Maintenance.objects.all().order_by('-datetime')
#     for detail in test.all():
#         emp = Employee.objects.get(pk = detail.employee_id)
#         emp_fname = emp.emp_fname
#         emp_lname = emp.emp_lname
#         emp_name = emp_fname + " " + emp_lname
#         print("name is %s" %(emp_name))
#         data.append(
#             {
#                 'id': detail.id,
#                 'machine': detail.machine,
#                 'datetime': detail.datetime,
#                 'state': detail.state,
#                 'desc': detail.desc,
#                 'emp_name' : emp_name
#             }
#         )
#     # MaintenanceFormSet = formset_factory(ReportModelForm, max_num=len(data))
#     # formset = MaintenanceFormSet(initial=data)
#     formset = data
#     print(data)
#     context['formset'] = formset
#
#     return render(request, template_name='reports/working.html', context= context)