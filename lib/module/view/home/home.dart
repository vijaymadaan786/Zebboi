import 'package:ehay/constants/size.dart';
import 'package:ehay/module/controller/app_controller.dart';
import 'package:ehay/module/controller/tag_controller.dart';
import 'package:ehay/module/view/home/components/banner_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/home_category.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      init: AppController(),
      builder: (appCtrl) {
        return ListView(
          // padding: EdgeInsets.only(top: 15, bottom: getScreenHeight(10)),
          children: const [
            BannerPanel(),
            // HomeCategory(categoryName: 'Bedroom'),
            // HomeCategory(categoryName: 'Bathroom')
            HomeCategoryContainer()
          ],
        );
      },
    );
  }
}

class HomeCategoryContainer extends StatelessWidget {
  const HomeCategoryContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TagController tagCtrl = Get.find();
    List<Widget> widgets = [];
    for (var element in tagCtrl.tags) {
      widgets.add(HomeCategory(categoryName: element.name));
    }
    return Column(children: widgets);
  }
}
