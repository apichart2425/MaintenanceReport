from django.db import models

# Create your models here.
from django.utils.safestring import mark_safe


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

    def __str__(self):
        return self.emp_fname

class Engineer(models.Model):
    employee = models.OneToOneField('Employee', primary_key=True, on_delete=models.CASCADE)
    eng_type = models.CharField(max_length=255)

class Machine(models.Model):
    mac_id = models.AutoField(primary_key=True)
    mac_name = models.CharField(max_length=255)
    mac_sum = models.CharField(max_length=255)
    mac_desc = models.TextField()
    image = models.ImageField(upload_to='images/machine/', null=True)

    def image_tag(self):
        return mark_safe('<img src="/media/%s" width="150" height="150" />' % (self.image))
    image_tag.short_description = 'Image'
    image_tag.allow_tags = True

    def __str__(self):
        return self.mac_name


class Maintenance(models.Model):
    machine = models.ForeignKey(Machine, on_delete=models.PROTECT)
    datetime = models.DateTimeField()
    PENDING = 'Pending'
    INPROGRESS = 'Inprogress'
    SUCCEED = 'Succeed'
    TYPES = (
        (PENDING, 'Pending'),
        (INPROGRESS, 'Inprogress'),
        (SUCCEED, 'Succeed')
    )
    state = models.CharField(max_length=50, choices=TYPES, default='Pending')
    desc = models.TextField()
    employee = models.ForeignKey(Employee, on_delete=models.PROTECT)



class Part(models.Model):
    part_code = models.CharField(max_length=255)
    # category = models.TextField
    cost = models.DecimalField(max_digits=8, decimal_places=2)
    part_desc = models.CharField(max_length=255)
    stock = models.IntegerField()
    minimum_stock = models.IntegerField()

    def __str__(self):
        return self.part_code+" : "+self.part_desc

class Category(models.Model):
    c_code = models.CharField(max_length=255)
    c_name = models.CharField(max_length=255)
    image = models.ImageField(upload_to='images/', default='images/test2.png', null=True)

    def image_tag(self):
        return mark_safe('<img src="/media/%s" width="150" height="150" />' % (self.image))
    image_tag.short_description = 'Image'
    image_tag.allow_tags = True

    def __str__(self):
        return self.c_name

class Category_Part(models.Model):
    p = models.ForeignKey(Part, on_delete=models.CASCADE)
    c = models.ForeignKey(Category, on_delete=models.CASCADE)


class Machine_Category(models.Model):
    machine = models.ForeignKey(Machine, on_delete=models.CASCADE)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)

    def __str__(self):
        return self.category.c_name

class Cart(models.Model):
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
    part = models.ForeignKey(Part, on_delete=models.CASCADE)
    quantity = models.IntegerField()
    for_machine = models.ForeignKey(Machine, on_delete=models.CASCADE)

class Order(models.Model):
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
    part = models.ForeignKey(Part, on_delete=models.CASCADE)
    quantity = models.IntegerField()
    datetime = models.DateTimeField()
    for_machine = models.ForeignKey(Machine, on_delete=models.CASCADE)

