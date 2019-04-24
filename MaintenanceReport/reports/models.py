from django.db import models

# Create your models here.

class Employee(models.Model):
    emp_fname = models.CharField(max_length=255)
    emp_lname = models.CharField(max_length=255)
    emp_phone = models.CharField(max_length=10)
    emp_address = models.EmailField(max_length=255)

    WEAVERS = '01'
    SUPERVISOR = '02'
    ENGINEER = '03'
    TYPES = (
        (WEAVERS, 'weavers'),
        (SUPERVISOR, 'supervisors'),
        (ENGINEER, 'engineer')
    )
    type = models.CharField(max_length=3, choices=TYPES, default='01', null=False)

    emp_salary = models.DecimalField(max_digits=8, decimal_places=2)

class Maintenance(models.Model):
    name = models.CharField(max_length=255)
    datetime = models.DateField()

    PENDING = '01'
    INPROGRESS = '02'
    SUCCEED = '03'
    TYPES = (
        (PENDING, 'Pending'),
        (INPROGRESS, 'Inprogress'),
        (SUCCEED, 'Succeed')
    )
    state = models.CharField(max_length=3, choices=TYPES, default='01')
    employee = models.ForeignKey(Employee, on_delete=models.PROTECT)



