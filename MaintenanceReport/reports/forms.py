from django import forms

from .models import Employee, Maintenance, Machine, Category


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


class ReportForm(forms.Form):
    CHOICES = Maintenance.TYPES
    id = forms.IntegerField()
    machine = forms.CharField(max_length=255)
    datetime = forms.DateTimeField()
    desc = forms.CharField(max_length=255, widget=forms.Textarea(attrs={'rows': 4, 'cols': 40}))
    state = forms.ChoiceField(choices=CHOICES)


class MachineModelForm(forms.ModelForm):
    class Meta:
        model = Machine
        fields = '__all__'

class CategoryModelForm(forms.ModelForm):
    class Meta:
        model = Category
        fields = '__all__'
