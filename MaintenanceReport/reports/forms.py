from django import forms

from .models import Employee, Maintenance


class RegisterModelForm(forms.ModelForm):
    user = forms.CharField(max_length=255)
    password = forms.CharField(max_length=255)
    re_password = forms.CharField(max_length=255)

    class Meta:
        model = Employee
        exclude = ['employee']


class ReportModelForm(forms.ModelForm):
    class Meta:
        model = Maintenance
        exclude = ['id', 'datetime', 'state', 'employee']
        # fields = '__all__'
