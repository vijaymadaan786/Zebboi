import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/assets_path.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/controller/app_controller.dart';
import 'package:ehay/module/controller/auth_controller.dart';
import 'package:ehay/module/model/item.dart';
import 'package:ehay/module/view/details/details.dart';
import 'package:ehay/module/view/product/product.dart';
import 'package:ehay/utils/helper/lazy_loader.dart';
import 'package:ehay/utils/hive_utils.dart';
import 'package:ehay/widgets/home_card_header.dart';
import 'package:ehay/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:hive/hive.dart';

class HomeCategory extends StatefulWidget {
  final String categoryName;
  const HomeCategory({Key? key, required this.categoryName}) : super(key: key);

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  AuthController auth = Get.find();
  var inputHeight = 240;

  List<Item> data = [];
  bool isLoading = true;

  void getItems() async {
    var items = await getAllItems(tag: widget.categoryName);
    if (mounted) {
      setState(() {
        data = items;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   image: DecorationImage(image: AssetImage(banner1), fit: BoxFit.cover),
      // ),
      height:
          auth.isUserExists.value ? getScreenHeight(298) : getScreenHeight(275),
      color: const Color(0xffFAFAFA),
      // color: kLightText,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     // HomeCardHeader(text: widget.categoryName),
          //     // const Spacer(
          //     //   flex: 1,
          //     // ),
          //     // GestureDetector(
          //     //   onTap: () => Get.to(() => ProductPage(
          //     //         title: widget.categoryName,
          //     //         tag: widget.categoryName,
          //     //       )),
          //     //   child: const Padding(
          //     //     padding:
          //     //         EdgeInsets.only(right: 15, left: 10, top: 5, bottom: 5),
          //     //     child: Text(
          //     //       'See all',
          //     //       style: TextStyle(
          //     //         color: Colors.black,
          //     //         fontWeight: FontWeight.bold,
          //     //       ),
          //     //     ),
          //     //   ),
          //     // ),
          //   ],
          // ),
          Expanded(
            child: Builder(builder: (context) {
              if (!isLoading && data.isEmpty) {
                return const Center(
                  child: Text("Product Not Available"),
                );
              } else {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                  itemCount: data.isEmpty ? 4 : data.length,
                  itemBuilder: (ctx, index) {
                    if (data.isEmpty && isLoading) {
                      return Container(
                        // height: getScreenHeight(253),
                        width: getScreeWidth(140),
                        margin: const EdgeInsets.only(right: 10),
                        child: const ShimmerLoader(),
                      );
                    } else {
                      return Row(
                        children: [
                          index == 0
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                        // color: logoPrimary,
                                        alignment: Alignment.center,
                                        child: GestureDetector(
                                          onTap: () => Get.to(() => ProductPage(
                                                title: widget.categoryName,
                                                tag: widget.categoryName,
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(widget.categoryName,
                                                style: const TextStyle(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'GalaxyBT',
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ),
                                        width: getScreeWidth(140),
                                        height: auth.isUserExists.value
                                            ? getScreenHeight(298)
                                            : getScreenHeight(275),
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                          image: AssetImage(container),
                                          fit: BoxFit.fill,
                                        ))),
                                  ),
                                )
                              : getHorizontalSpace(10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              width: getScreeWidth(140),
                              // margin: const EdgeInsets.only(right: 5),
                              child: ProductItem(
                                item: data[index],
                                widthSize: getScreeWidth(140),
                                press: () {
                                  Get.to(() => DetailsPage(item: data[index]));
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
