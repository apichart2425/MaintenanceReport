from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('login/', views.my_login, name='login'),
    path('register/', views.my_register, name='register'),
    path('reportform/', views.report_form, name='reportform'),
    path('detail/<int:maintenance_id>', views.detail, name='detail'),
    path('logout/', views.my_logout, name='logout'),
    path('stockpick/<int:category_id>/<int:machine_id>', views.stock_list, name='stockpick'),
    path('addtocart/<int:part_id>/<int:machine_id>', views.addtocart, name='addtocart'),
    path('cart/<int:category_id>/<int:machine_id>', views.cart, name='cart'),
    path('deleteitem/<int:part_id>/<int:for_machine_id>', views.deleteitem, name='deleteitem'),
    path('selectcategory/<int:machine_id>', views.selectcategory, name='selectcategory'),
    path('selectmachine/', views.selectmachine, name='selectmachine'),
    path('graph/', views.graph, name='graph'),
    path('additem/<int:part_id>/<int:for_machine_id>/<int:employee_id>', views.additem, name='additem'),
    path('decreaseitem/<int:part_id>/<int:for_machine_id>/<int:employee_id>', views.decreaseitem, name='decreaseitem')
    # path('working/', views.working, name='working')
]
