import datetime

from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User, Group
from django.forms import formset_factory
from django.http import HttpResponse
from django.shortcuts import render, redirect

# Create your views here.
from .models import Maintenance, Category, Category_Part, Part, Cart, Order
from .forms import RegisterModelForm, ReportModelForm, ReportForm


@login_required
def index(request):
    data = []
    context = {}
    print(request.user)
    test = Maintenance.objects
    for detail in test.all():
        data.append(
            {
                'id': detail.id,
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
    context = {'form': form}
    return render(request,'reports/register.html', context=context)

@login_required
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

@login_required
def detail(request, maintenance_id):
    context = {}
    detail = Maintenance.objects.get(pk=maintenance_id)
    data = [{
                'id': detail.id,
                'machine': detail.machine,
                'datetime': detail.datetime,
                'state': detail.state,
                'desc': detail.desc
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

def stock_list(request):
    data_stock = []
    object_list = Category.objects.all()
    for stock in object_list:
        category_part = Category_Part.objects.filter(c=stock.id)
        for part_list in category_part:
            part = Part.objects.filter(id=part_list.p_id)
            for detail in part:
                data_stock.append({
                    'c_id': stock.c_name,
                    'p_id': part_list.p_id,
                    'part_name': detail.part_name,
                    'cost': detail.part_desc,
                    'stock': detail.stock,
                    'minimum_stock': detail.minimum_stock
                })
    context = {
        'stock_part': data_stock,
        'stock_list': object_list
    }

    return render(request, template_name='reports/stockpick.html', context=context)

def addtocart(request, part_id):
    part = Part.objects.get(id=part_id)
    part_stock = part.stock
    if part_stock > 0:
        part.stock = part_stock-1
        try:
            cart = Cart.objects.get(part_id=part_id)
            print(cart)
            cart.quantity = cart.quantity+1
            cart.save()

        except Cart.DoesNotExist:
            print("NONONO")
            Cart.objects.create(
                employee_id=request.user.id,
                part_id=part_id,
                quantity=1
            )
    else:
        print('OUT OF STOCK')
    part.save()

    return redirect('stockpick')

def cart(request):
    data = []
    cart = Cart.objects.filter(employee_id=request.user.id)
    for item in cart:
        part = Part.objects.get(pk=item.part_id)
        data.append({
            'quantity':item.quantity,
            'employee_id':request.user.id,
            'part_id':item.part_id,
            'part_name':part.part_name,
            'cost':part.cost
        })
    context = {
        'item_list': data
    }
    return render(request, template_name='reports/cart.html', context=context)

def deleteitem(request, part_id):
    cart = Cart.objects.get(part_id=part_id)
    part = Part.objects.get(id=part_id)
    part.stock = part.stock+cart.quantity
    part.save()
    cart.delete()

    return redirect('cart')

def pickupconfirm(request):
    cart_list = Cart.objects.filter(employee_id=request.user.id)
    for item in cart_list:
        Order.objects.create(
            quantity=item.quantity,
            datetime=datetime.datetime.today(),
            employee_id=request.user.id,
            part_id=item.part_id
        )
    cart_list.delete()

    return redirect('stockpick')
