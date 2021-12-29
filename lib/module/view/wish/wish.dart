import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/controller/wishlist_controller.dart';
import 'package:ehay/module/model/item.dart';
import 'package:ehay/module/view/details/details.dart';
import 'package:ehay/module/view/wish/components/wish_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishPage extends StatefulWidget {
  final bool? hideAppbar;
  const WishPage({Key? key, this.hideAppbar}) : super(key: key);

  @override
  State<WishPage> createState() => _WishPageState();
}

class _WishPageState extends State<WishPage> {
  WishlistController wishlist = Get.find();
  // List<Item> items = [];
  // List<dynamic> wishlistItems = [];

  @override
  void initState() {
    super.initState();
    // var box = Hive.box<Item>('items');
    // setState(() {
    //   // GetStorage().erase();
    //   items = box.values
    //       .where((element) => wishlist.wishlistItems.contains(element.name))
    //       .toList();
    // });
  }

  void handleRemove(Item item) {
    wishlist.removeItem(item.name);
  }

  @override
  Widget build(BuildContext context) {
    // print(hideAppbar);
    // AuthController authCtrl = Get.find();
    // CartController cart = Get.put(CartController());
    return Scaffold(
      appBar: widget.hideAppbar == true
          ? null
          : AppBar(
              leadingWidth: getScreeWidth(70),
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: getScreeWidth(36),
                  width: getScreeWidth(36),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
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
                "Wishlist",
                style: TextStyle(
                  color: kDark,
                  fontSize: getTextSize(16),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: Obx(() {
              if (wishlist.items.isEmpty) {
                // return Expanded(
                //   child: Center(
                //     child: Column(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         SvgPicture.asset(
                //           wishIcon,
                //           color: Colors.grey,
                //           height: 50,
                //         ),
                //         getVerticalSpace(15),
                //         Text(
                //           "Empty",
                //           style: GoogleFonts.rubik(
                //             fontSize: getTextSize(18),
                //             color: kLightText,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // );
                return const Center(
                  child: Text('Wishlist is empty'),
                );
              }
              return ListView(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 15, bottom: 15),
                children: [
                  ...List.generate(
                    wishlist.items.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {});
                        Get.to(() =>
                            DetailsPage(item: wishlist.items[index] as Item));
                        //
                      },
                      child: WishItem(
                        item: wishlist.items[index] as Item,
                        index: index,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 80,
                  )
                ],
              );
            }),
          );
        },
      ),
    );
  }
}
