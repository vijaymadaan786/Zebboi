import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/app_constants.dart';
import 'package:ehay/constants/assets_path.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/controller/app_controller.dart';
import 'package:ehay/module/controller/filter_controller.dart';
import 'package:ehay/module/view/product/product.dart';
import 'package:ehay/widgets/bottom_nav.dart';
import 'package:ehay/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LandPage extends StatelessWidget {
  const LandPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      extendBody: true,
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (ctx, constrains) {
            return SizedBox(
              height: constrains.maxHeight,
              child: GetBuilder<AppController>(
                init: AppController(),
                builder: (app) => Column(
                  children: [
                    const AppHeader(),
                    Expanded(
                      child: PageView.builder(
                        itemCount: screenPages.length,
                        controller: app.appPageCtrl,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return screenPages[app.navBarIndex.value];
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}

class AppHeader extends StatelessWidget {
  const AppHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FilterController filterController = Get.find();
    AppController app = Get.find();
    return Container(
      height: getScreenHeight(60),
      width: double.infinity,
      alignment: Alignment.center,
      color: kAppBgColor,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                height: getScreeWidth(36),
                width: getScreeWidth(36),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(menuIcon),
              ),
            );
          }),
          Obx(() {
            return Text(
              "${app.pageTitle}",
              style: app.navBarIndex.value == 0
                  ? TextStyle(
                      color: kDark,
                      fontSize: getTextSize(26),
                      fontWeight: FontWeight.w900,
                      fontFamily: 'GalaxyBT')
                  : TextStyle(
                      color: kDark,
                      fontSize: getTextSize(26),
                      fontWeight: FontWeight.w900,
                      fontFamily: 'GalaxyBT'),
            );
          }),
          Obx(() {
            return Visibility(
              visible: app.navBarIndex.value == 0,
              child: GestureDetector(
                onTap: () {
                  filterController.isSearch.value = true;
                  Get.to(() => const ProductPage());
                },
                child: Container(
                  height: getScreeWidth(36),
                  width: getScreeWidth(36),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: SvgPicture.asset(searchIcon),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
