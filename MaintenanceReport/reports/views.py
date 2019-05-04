import datetime

from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User, Group
from django.forms import formset_factory
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, redirect, render_to_response

# Create your views here.
from .models import Maintenance, Category, Category_Part, Part, Cart, Order, Machine_Category, Machine, Employee
from .forms import RegisterModelForm, ReportModelForm, ReportForm


@login_required
def index(request):
    data = []
    context = {'title': "รายการแจ้งซ่อม",}
    print(request.user)
    test = Maintenance.objects
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
            return redirect('index')

    form = RegisterModelForm()
    context = {'title': "สมัครสมาชิก",'form': form}
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

def my_logout(request):
    logout(request)
    return  redirect('login')

def stock_list(request, category_id, machine_id):
    data_stock = []
    object_list = Category.objects.filter(id=category_id)
    for stock in object_list:
        category_part = Category_Part.objects.filter(c=stock.id)
        for part_list in category_part:
            part = Part.objects.filter(id=part_list.p_id)
            for detail in part:
                data_stock.append({
                    'c_name': stock.c_name,
                    'p_id': part_list.p_id,
                    'part_name': detail.part_name,
                    'cost': detail.cost,
                    'part_desc': detail.part_desc,
                    'stock': detail.stock,
                    'minimum_stock': detail.minimum_stock
                })
    context = {
        'stock_part': data_stock,
        'stock_list': object_list,
        'category_id': category_id,
        'machine_id': machine_id
    }

    return render(request, template_name='reports/stock/stockpick.html', context=context)

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

def cart(request, category_id, machine_id):
    data = []
    cart = Cart.objects.filter(employee_id=request.user.id)
    for item in cart:
        part = Part.objects.get(pk=item.part_id)
        machine = Machine.objects.get(pk=item.for_machine_id)
        data.append({
            'quantity':item.quantity,
            'employee_id':request.user.id,
            'part_id':item.part_id,
            'part_name':part.part_name,
            'cost':part.cost,
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

def deleteitem(request, part_id, for_machine_id):
    cart = Cart.objects.get(part_id=part_id, for_machine_id=for_machine_id)
    part = Part.objects.get(id=part_id)
    part.stock = part.stock+cart.quantity
    part.save()
    cart.delete()

    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    # return redirect('cart')

def selectcategory(request, machine_id):
    data = []
    machine = Machine_Category.objects.filter(machine_id=machine_id)
    print(machine)
    for category_list in machine:
        category = Category.objects.filter(id=category_list.category_id)
        machine_name = Machine.objects.get(pk=machine_id)
        title = "อะไหล่อุปกรณ์ " + str(machine_name)
        for item in category:
            data.append({
                'id': item.id,
                'c_code': item.c_code,
                'c_name': item.c_name
            })
    context = {
        'title': title,
        'category': data,
        'machine_id': machine_id
    }
    print("name %s" %title)
    return render(request, template_name='reports/stock/selectcategory.html', context=context)

def selectmachine(request):
    machine = Machine.objects.all()
    context = {
        'title': "รายการเครื่องจักรทอผ้า",
        'machine_list': machine
    }
    return render(request, template_name='reports/stock/selectmachine.html', context=context)
