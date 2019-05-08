from django import forms

from .models import Employee, Maintenance, Machine, Category


class RegisterModelForm(forms.ModelForm):
    user = forms.CharField(max_length=255, widget=forms.TextInput(attrs={'class': 'form-control'}))
    password = forms.CharField(max_length=255, widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    re_password = forms.CharField(max_length=255, widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    # type = forms.ChoiceField(choices=Employee.TYPES, widget=forms.RadioSelect),

    def clean(self):
        cleaned_data = super().clean()
        new = cleaned_data.get('password')
        repass = cleaned_data.get('re_password')
        if new != repass:
            raise forms.ValidationError('"รหัสผ่าน" และ "ยืนยันรหัสผ่าน" ต้องเหมือนกัน')
    class Meta:
        model = Employee
        exclude = ['employee']
        fields = ['emp_fname','emp_lname','emp_email','emp_phone','emp_address','type','emp_salary']
        widgets = {
            'emp_fname': forms.TextInput(attrs={'class': 'form-control'}),
            'emp_lname': forms.TextInput(attrs={'class': 'form-control'}),
            'emp_email': forms.EmailInput(attrs={'class': 'form-control'}),
            'emp_phone': forms.TextInput(attrs={'class': 'form-control'}),
            'emp_address': forms.Textarea(attrs={'class': 'form-control'}),
            'type': forms.Select(attrs={'class': 'form-control'}),
            'emp_salary': forms.TextInput(attrs={'class': 'form-control'}),
        }


class ReportModelForm(forms.ModelForm):

    class Meta:
        model = Maintenance
        exclude = ['id', 'datetime', 'state', 'employee','emp_fname']
        fields = ['machine', 'desc']
        widgets = {
            'machine': forms.Select(attrs={'class': 'form-control'}),
            'desc':  forms.Textarea(attrs={'class': 'form-control'}),
        }
        # fields = '__all__'


class ReportForm(forms.Form):
    CHOICES = Maintenance.TYPES
    id = forms.IntegerField(widget=forms.TextInput(attrs={'class': 'form-control'}))
    machine = forms.CharField(max_length=255, widget=forms.TextInput(attrs={'class': 'form-control'}) )
    datetime = forms.DateTimeField()
    desc = forms.CharField(max_length=255, widget=forms.Textarea(attrs={'class': 'form-control'}))
    state = forms.ChoiceField(choices=CHOICES,widget=forms.Select(attrs={'class': 'form-control'}))


class MachineModelForm(forms.ModelForm):
    class Meta:
        model = Machine
        fields = '__all__'

class CategoryModelForm(forms.ModelForm):
    class Meta:
        model = Category
        fields = '__all__'

class DateSelectForm(forms.Form):
    start_date = forms.DateField(required=True,
                                 widget=forms.widgets.DateInput(attrs={'type':'date'}))
    end_date = forms.DateField(required=True,
                                 widget=forms.widgets.DateInput(attrs={'type':'date'}))
