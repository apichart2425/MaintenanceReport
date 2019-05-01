from django.db import models

# Create your models here.
class Employee(models.Model):

    employee = models.OneToOneField('auth.User', on_delete=models.CASCADE, primary_key=True)
    emp_fname = models.CharField(max_length=255)
    emp_lname = models.CharField(max_length=255)
    emp_phone = models.CharField(max_length=10)
    emp_email = models.EmailField(max_length=255)
    emp_address = models.TextField()

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

class Engineer(models.Model):
    employee = models.OneToOneField('Employee', primary_key=True, on_delete=models.CASCADE)
    eng_type = models.CharField(max_length=255)

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

class Machine(models.Model):
    mac_id = models.AutoField(primary_key=True)
    mac_name = models.CharField(max_length=255)
    mac_sum = models.CharField(max_length=255)
    mac_desc = models.TextField()

class Part(models.Model):
    part_id = models.AutoField(primary_key=True)
    part_name = models.CharField(max_length=255)
    category = models.TextField
    cost = models.DecimalField(max_digits=8, decimal_places=2)
    part_desc = models.CharField(max_length=255)
    stock = models.IntegerField()
    minimum_stock = models.IntegerField()

class Machine_Part(models.Model):
    part = models.ForeignKey(Part, on_delete=models.CASCADE, unique=True)
    machine = models.ForeignKey(Machine, on_delete=models.CASCADE, unique=True)
    unit = models.IntegerField()
    maintenance = models.ManyToManyField(Maintenance, through='Maintenance_Machine_Part')
    class Meta:
        unique_together = (('part','machine'),)

class Maintenance_Machine_Part(models.Model):
    maintenance = models.ForeignKey(Maintenance, on_delete=models.CASCADE)
    machine_part = models.ForeignKey(Machine_Part, on_delete=models.CASCADE)
    description = models.CharField(max_length=255)
