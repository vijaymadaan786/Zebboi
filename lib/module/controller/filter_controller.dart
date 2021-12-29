import 'package:get/get.dart';

class FilterController extends GetxController {
  var size = 'None'.obs;
  var tag = 'None'.obs;
  var category = 'None'.obs;
  var color = 'None'.obs;
  RxBool isSearch = false.obs;
  var brand = 'None'.obs;
  var brandList = ['None', 'Italica', 'Simola', 'Zebboi'];
  var sizeList = [
    'None',
    '800x600',
    '600x600',
    '1000x1000',
    '800x1200',
    '800x1600',
    '800x800',
    '600x1200',
    '200x1200'
  ];
  var usedFiltersCount = 0.obs;

  updateUsedFiltersCount() {
    usedFiltersCount.value = 0;
    if (size.value != 'None') usedFiltersCount++;
    if (tag.value != 'None') usedFiltersCount++;
    if (category.value != 'None') usedFiltersCount++;
    if (color.value != 'None') usedFiltersCount++;
    if (brand.value != 'None') usedFiltersCount++;
    update();
  }

  resetFilters() {
    size.value = 'None';
    tag.value = 'None';
    category.value = 'None';
    color.value = 'None';
    brand.value = 'None';
    isSearch.value = false;
    updateUsedFiltersCount();
  }
}
