import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/core/account.dart';
import 'package:ehay/module/controller/auth_controller.dart';
import 'package:ehay/module/controller/wishlist_controller.dart';
import 'package:ehay/module/model/banner_model.dart';
import 'package:ehay/module/view/cart/cart.dart';
import 'package:ehay/module/view/category/category.dart';
import 'package:ehay/module/view/home/home.dart';
import 'package:ehay/module/view/wish/wish.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'assets_path.dart';
import 'package:get/get.dart';

AuthController auth = Get.find();
WishlistController wish = Get.find();

Widget getScreen() {
  return Obx(() => auth.isUserExists.value
      ? const CartPage()
      : const WishPage(
          hideAppbar: true,
        ));
}

List<Widget> screenPages = [
  const HomePage(),
  const CategoryPage(),
  // auth.isUserExists.value ? CartPage() : WishPage(),
  getScreen(),
  const AccountPage(),
];

List<BannerModel> bannerList = [
  BannerModel(
    title: '',
    offerText: '',
    imgUrl: banner1,
  ),
  BannerModel(
    title: '',
    offerText: '',
    imgUrl: banner2,
  ),
  BannerModel(
    title: '',
    offerText: '',
    imgUrl: banner3,
  ),
];
List<BannerModel> flashBannerList = [
  BannerModel(
    title: '',
    offerText: '',
    imgUrl: flash1,
  ),
  BannerModel(
    title: '',
    offerText: '',
    imgUrl: flash2,
  ),
];

// Gradient Color
LinearGradient gradientColor = const LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  // stops: [0, 1],
  colors: [
    kLightOrange,
    kPrimary,
  ],
);

//Auth BG Decoration
BoxDecoration boxDecoration = BoxDecoration(
  image: DecorationImage(
    image: const AssetImage(authBG),
    colorFilter: ColorFilter.mode(
      Colors.black.withOpacity(0.8),
      BlendMode.darken,
    ),
    fit: BoxFit.cover,
  ),
);

//Auth InputDecoration
OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.white,
  ),
);

//Auth InputDecoration
OutlineInputBorder dealerInputBorder = const OutlineInputBorder(
  borderSide: BorderSide(
    color: Color(0xffEEC660),
  ),
);

//Search decoration
BoxDecoration searchBoxDecoration() {
  return BoxDecoration(
    color: const Color(0xffF5F5F5),
    borderRadius: BorderRadius.circular(6),
    border: Border.all(
      width: 1,
      color: kPrimary,
    ),
  );
}

InputDecoration buildCredentialDecoration({@required hintText, icon}) {
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(
      width: 1,
      color: Color(0xffF5F5F5),
    ),
  );
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      color: kLightText,
      fontWeight: FontWeight.w400,
      fontSize: getTextSize(12),
    ),
    fillColor: const Color(0xffFFFFFF),
    filled: true,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    enabledBorder: outlineInputBorder,
    border: outlineInputBorder,
    focusedBorder: outlineInputBorder.copyWith(
      borderSide: const BorderSide(
        color: kPrimary,
        width: 0.5,
      ),
    ),
  );
}

TextStyle descriptionText() {
  return TextStyle(
    fontSize: getTextSize(12),
    fontWeight: FontWeight.bold,
    color: Colors.red.shade600,
    letterSpacing: 0.3,
    height: 1.5,
  );
}

TextStyle infoText() {
  return TextStyle(
      color: Colors.lightBlue.shade300,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.3,
      height: 1.5,
      fontSize: getTextSize(12));
}
