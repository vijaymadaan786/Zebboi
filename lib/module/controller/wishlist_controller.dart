import 'package:ehay/module/model/item.dart';
import 'package:ehay/utils/hive_utils.dart' as item_util;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';

class WishlistController extends GetxController {
  var wishlistItems = [].obs;
  var items = [].obs;
  var box = GetStorage();

  @override
  void onInit() async {
    var persistedItems = box.read('wishlistItems');
    if (persistedItems != null) {
      wishlistItems.addAll(persistedItems);
      var box = await Hive.openBox<Item>('items');
      var wishItems =
          box.values.where((element) => wishlistItems.contains(element.name));
      items.addAll(wishItems);
      update();
    }
    super.onInit();
  }

  addItem(itemName) async {
    wishlistItems.add(itemName);
    box.write('wishlistItems', wishlistItems);
    // var box = Hive.lazyBox<Item>('items');
    var wishItem = await item_util.get(itemName);
    items.add(wishItem);
    update();
  }

  removeItem(itemName) async {
    wishlistItems.remove(itemName);
    box.write('wishlistItems', wishlistItems);
    items.removeWhere((item) => item.name == itemName);
    update();
  }
}
