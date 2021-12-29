import 'package:carousel_slider/carousel_slider.dart';
import 'package:ehay/module/controller/cart_list_controller.dart';
import 'package:ehay/module/controller/filter_controller.dart';
import 'package:ehay/module/controller/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ehay/module/controller/auth_controller.dart';

class AppController extends GetxController {
  AuthController auth = Get.find();
  FilterController filterController = Get.put(FilterController());
  WishlistController wishlist = Get.find();
  CartListController cart = Get.find();
  RxBool isRemember = false.obs;
  var navBarIndex = 0.obs;
  RxInt carousalIndex = 0.obs;
  RxInt homeTabIndex = 0.obs;
  RxInt productTabIndex = 0.obs;
  RxString pageTitle = "Zebboi".obs;
  RxDouble height = 250.0.obs;
  PageController appPageCtrl =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  PageController tabPageCtrl =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  PageController productPageCtrl =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);

  CarouselController carousalController = CarouselController();

  var flashEndTime =
      DateTime.now().add(const Duration(days: 2)).millisecondsSinceEpoch;

  changeScreenPage(int v) {
    navBarIndex(v);
    appPageCtrl.animateToPage(v,
        duration: 300.milliseconds, curve: Curves.ease);
    switch (v) {
      case 0:
        pageTitle("Zebboi");
        break;
      case 1:
        pageTitle("Category");
        break;
      case 2:
        auth.isUserExists.value ? pageTitle("MyCart") : pageTitle("WishList");
        break;
      case 3:
        pageTitle("My Account");
        break;
      default:
        break;
    }
    update();
  }
}
