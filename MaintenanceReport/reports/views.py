from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
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
