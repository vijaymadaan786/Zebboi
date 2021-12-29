import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/controller/app_controller.dart';
import 'package:ehay/module/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.find();

    List<Map<String, String>> navBarItems = [
      {
        'label': 'Home',
        'inactive': 'assets/icons/home.svg',
        'active': 'assets/icons/home-fill.svg',
      },
      {
        'label': 'Category',
        'inactive': 'assets/icons/cat.svg',
        'active': 'assets/icons/cat-fill.svg',
      },
      {
        'isDynamic': 'yes',
        'authLabel': 'Cart',
        'label': 'Wish',
        'authInactive': 'assets/icons/cart-fill.svg',
        'inactive': 'assets/icons/wish-icon.svg',
        'authActive': 'assets/icons/cart-fill.svg',
        'active': 'assets/icons/wish-icon.svg',
      },
      {
        'label': 'Account ',
        'inactive': 'assets/icons/profile.svg',
        'active': 'assets/icons/profile-fill.svg',
      },
    ];

    AppController navCtrl = Get.find();
    return Obx(
      () => Container(
        height: getScreenHeight(80),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        decoration: const BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
            bottom: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              spreadRadius: 0,
              blurRadius: 15,
              color: Color.fromRGBO(0, 0, 0, 0.1),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: navBarItems.asMap().entries.map((e) {
            return InkWell(
              onTap: () {
                navCtrl.changeScreenPage(e.key);
              },
              child: AnimatedContainer(
                  duration: 500.milliseconds,
                  curve: Curves.ease,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        e.value['isDynamic'] == 'yes'
                            ? auth.isUserExists.value
                                ? navCtrl.navBarIndex.value == e.key
                                    ? e.value['authActive']!
                                    : e.value['authInactive']!
                                : navCtrl.navBarIndex.value == e.key
                                    ? e.value['active']!
                                    : e.value['inactive']!
                            : navCtrl.navBarIndex.value == e.key
                                ? e.value['active']!
                                : e.value['inactive']!,
                        height: getScreeWidth(24),
                        color: navCtrl.navBarIndex.value == e.key
                            ? kPrimary
                            : kAppIcon,
                      ),
                      getVerticalSpace(8),
                      Text(
                        e.value['isDynamic'] == 'yes'
                            ? auth.isUserExists.value
                                ? e.value['authLabel']!
                                : e.value['label']!
                            : e.value['label']!,
                        style: TextStyle(
                          fontSize: getTextSize(14),
                          color: navCtrl.navBarIndex.value == e.key
                              ? kPrimary
                              : kIconText,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                        ),
                      )
                    ],
                  )),
            );
          }).toList(),
        ),
      ),
    );
  }
}
