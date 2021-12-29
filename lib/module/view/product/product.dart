import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/assets_path.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/controller/filter_controller.dart';
import 'package:ehay/module/view/product/components/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  final String? title;
  final String? tag;
  const ProductPage({Key? key, this.title, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FilterController filterController = Get.find();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: getScreeWidth(70),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            // height: getScreenHeight(240),
            width: getScreeWidth(36),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: kDark,
            ),
          ),
        ),
        title: Text(
          title ?? 'All Items',
          style: TextStyle(
              color: kDark,
              fontSize: getTextSize(26),
              fontWeight: FontWeight.w900,
              fontFamily: 'GalaxyBT'),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              filterController.isSearch.value =
                  !filterController.isSearch.value;
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // height: getScreeWidth(36),
                width: getScreeWidth(36),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset(searchIcon),
              ),
            ),
          ),
        ],
      ),
      body: LayoutBuilder(builder: (ctx, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 15),
            children: [
              ProductItemList(
                category: title,
                tag: tag,
                size: title != null && title!.split('x').length == 2
                    ? title
                    : null,
              ),
            ],
          ),
        );
      }),
    );
  }
}
