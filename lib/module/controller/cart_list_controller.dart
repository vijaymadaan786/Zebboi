import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartListController extends GetxController {
  var itemsMeta = [].obs;
  var box = GetStorage();
  var items = [].obs;

  @override
  void onInit() {
    super.onInit();
    var itemsMetaPersisted = box.read('cartItems');
    if (itemsMetaPersisted != null) {
      itemsMeta.addAll(itemsMetaPersisted);
      update();
    }
  }

  clearCart() {
    itemsMeta.clear();
    items.clear();
    box.remove('cartItems');
    update();
  }

  add(itemName, qty, rate, variant) async {
    itemsMeta.removeWhere((element) =>
        element['itemName'] == itemName && element['variant'] == variant);
    itemsMeta.add(
        {'itemName': itemName, 'qty': qty, 'rate': rate, 'variant': variant});
    box.write('cartItems', itemsMeta);
    update();
  }

  remove(itemName, variant) async {
    itemsMeta.removeWhere((element) =>
        element['itemName'] == itemName && element['variant'] == variant);
    box.write('cartItems', itemsMeta);
    update();
  }
}
