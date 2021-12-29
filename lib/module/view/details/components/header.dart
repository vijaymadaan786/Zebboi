import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/assets_path.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/controller/wishlist_controller.dart';
import 'package:ehay/module/model/item.dart';
import 'package:ehay/utils/helper/show_snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Header extends StatefulWidget {
  final Item item;

  const Header({Key? key, required this.item}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    WishlistController wishlist = Get.put(WishlistController());

    return Container(
      height: getScreenHeight(60),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: SvgPicture.asset(
                "assets/icons/back-arrow.svg",
                color: kDark,
              ),
            ),
            Text(
              'Detail',
              style: TextStyle(
                  color: kDark,
                  fontSize: getTextSize(26),
                  fontWeight: FontWeight.w900,
                  fontFamily: 'GalaxyBT'),
            ),
            IconButton(
              onPressed: () {
                wishlist.wishlistItems.contains(widget.item.name)
                    ? SnackMessage.instance
                        .showSnack(message: 'Item removed from WishList')
                    : SnackMessage.instance
                        .showSnack(message: 'Item Added to WishList');

                wishlist.wishlistItems.contains(widget.item.name)
                    ? wishlist.removeItem(widget.item.name)
                    : wishlist.addItem(widget.item.name);
              },
              icon: SvgPicture.asset(
                  wishlist.wishlistItems.contains(widget.item.name)
                      ? heartFillIcon
                      : heartIcon,
                  color: wishlist.wishlistItems.contains(widget.item.name)
                      ? Colors.red
                      : Colors.black),
            )
          ],
        );
      }),
    );
  }
}
