import 'package:ehay/config/routes/app_routes.dart';
import 'package:ehay/module/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../constants/app_color.dart';
import '../constants/assets_path.dart';

import 'package:ehay/global.dart' as global;

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.find();
    // CartController cart = Get.find();
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              curve: Curves.easeIn,
              padding: EdgeInsets.zero,
              margin: const EdgeInsets.only(bottom: 20),
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.centerLeft,
                children: [
                  SvgPicture.asset(
                    splashDraw,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            DrawerItem(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              )),
              hoverColor: kPrimary,
              title: "All Items",
              icon: orderIcon,
              press: () {
                Get.offAndToNamed(AppRoute.productPage);
              },
            ),
            const CustomDivider(),
            if (!auth.isUserExists.value)
              DrawerItem(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  )),
                  title: "Locate Dealer",
                  icon: profile,
                  hoverColor: kPrimary,
                  press: () {
                    Get.offAndToNamed(AppRoute.dealerPage);
                  }),
            if (!auth.isUserExists.value) const CustomDivider(),
            if (auth.isUserExists.value)
              DrawerItem(
                title: "Order History",
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                )),
                icon: historyIcon,
                hoverColor: kPrimary,
                press: () {
                  if (global.isSignIn) {
                    Get.offAndToNamed(AppRoute.orderPage);
                  }
                },
              ),
            if (auth.isUserExists.value) const CustomDivider(),
            if (auth.isUserExists.value)
              DrawerItem(
                title: "Wish-list",
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                )),
                hoverColor: kPrimary,
                icon: wishIcon,
                press: () {
                  Get.offAndToNamed(AppRoute.wishlistPage);
                },
              ),
            if (auth.isUserExists.value) const CustomDivider(),
            DrawerItem(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              )),
              hoverColor: kPrimary,
              title: "About",
              icon: aboutIcon,
              press: () {
                Get.offAndToNamed(AppRoute.aboutPage);
              },
            ),
            const CustomDivider(),
            DrawerItem(
              title: "Terms & Conditions",
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              )),
              hoverColor: kPrimary,
              icon: conditionsIcon,
              press: () {
                Get.offAndToNamed(AppRoute.conditionPage);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => const Divider(
        indent: 20,
        height: 10,
      );
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    this.title,
    this.press,
    this.icon,
    this.shape,
    this.textColor = kDark,
    this.hoverColor,
  }) : super(key: key);

  final String? title;
  final VoidCallback? press;
  final String? icon;
  final Color? textColor;
  final ShapeBorder? shape;
  final Color? hoverColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      hoverColor: hoverColor,
      shape: shape,
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      horizontalTitleGap: 15,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      leading: SvgPicture.asset(
        icon!,
        color: kPrimary,
        // height: getScreeWidth(20),
        // width: getScreeWidth(20),
      ),
      title: Text(title!,
          style: Get.textTheme.subtitle2!.copyWith(
            color: textColor,
            height: 0.5,
          )),
      trailing: const Icon(Icons.arrow_forward_ios, size: 10),
      onTap: press,
    );
  }
}
