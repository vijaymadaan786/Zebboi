import 'package:ehay/module/controller/app_controller.dart';
import 'package:ehay/module/controller/auth_controller.dart';
import 'package:ehay/module/controller/cart_list_controller.dart';
import 'package:ehay/module/controller/filter_controller.dart';
import 'package:ehay/module/controller/tag_controller.dart';
import 'package:ehay/module/controller/wishlist_controller.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WishlistController>(() => WishlistController());
    Get.lazyPut<FilterController>(() => FilterController());
    Get.lazyPut<AppController>(() => AppController());
    Get.lazyPut<CartListController>(() => CartListController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<TagController>(() => TagController());
  }
}
