from django import forms

from .models import Employee


class RegisterModelForm(forms.ModelForm):
    user = forms.CharField(max_length=255)
    password = forms.CharField(max_length=255)
    re_password = forms.CharField(max_length=255)

    class Meta:
        model = Employee
        exclude = ['employee']
