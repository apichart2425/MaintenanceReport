from django.contrib import admin
from django.contrib.auth.models import Permission

from .models import Machine, Category, Machine_Category, Part, Category_Part


class PartInLine(admin.StackedInline):
    model = Category_Part
    extra = 1

class CategoryInLine(admin.StackedInline):
    model = Machine_Category
    verbose_name = "อุปกรณ์"
    verbose_name_plural = "อุปกรณ์ที่มี"
    
    extra = 1

class CategoryAdmin(admin.ModelAdmin):
    list_display = ['id', 'c_code', 'c_name', 'image_tag']
    readonly_fields = ('image_tag',)
    list_per_page = 10
    search_fields = ['id', 'c_code', 'c_name']
    ordering = ('id',)

    inlines = [PartInLine]

class CategoryPartInLine(admin.StackedInline):
    model = Category_Part
    extra = 1

class PartAdmin(admin.ModelAdmin):
    list_display = ['id', 'part_code', 'part_desc', 'stock', 'minimum_stock', 'cost']
    list_per_page = 10
    ordering = ('id',)
    search_fields = ['part_name', 'id','part_desc']
    inlines = [CategoryPartInLine]


class MachineAdmin(admin.ModelAdmin):
    list_display = ['mac_id', 'mac_name', 'mac_sum', 'mac_desc', 'image_tag']
    readonly_fields = ('image_tag',)
    list_per_page = 10
    ordering = ('mac_id',)

    inlines = [CategoryInLine]

admin.site.register(Machine, MachineAdmin)

admin.site.register(Part, PartAdmin)

admin.site.register(Category, CategoryAdmin)


