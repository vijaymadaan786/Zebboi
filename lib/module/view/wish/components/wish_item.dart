import 'package:cached_network_image/cached_network_image.dart';
import 'package:ehay/constants/api_path.dart';
import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/assets_path.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/controller/wishlist_controller.dart';
import 'package:ehay/module/model/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WishItem extends StatelessWidget {
  const WishItem({
    Key? key,
    required this.item,
    this.index,
  }) : super(key: key);
  final Item item;
  final int? index;

  @override
  Widget build(BuildContext context) {
    WishlistController wishlist = Get.find();

    return Container(
      height: getScreenHeight(100),
      width: getScreeWidth(345),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
              width: 80,
              fit: BoxFit.cover,
              memCacheHeight: 600,
              memCacheWidth: 600,
              errorWidget: (context, url, error) => Image.asset(
                    'assets/images/image_placeholder.jpg',
                    fit: BoxFit.cover,
                  ),
              imageUrl: item.image![0].startsWith("/file")
                  ? baseUrl + item.image![0]
                  : item.image![0]),
          getHorizontalSpace(10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.itemName.toString(),
                          maxLines: 2,
                          style: GoogleFonts.rubik(
                            fontSize: getTextSize(14),
                            fontWeight: FontWeight.w400,
                            height: 1.4,
                            color: kDark,
                          ),
                        ),
                      ),
                      getHorizontalSpace(8),
                      InkWell(
                        onTap: () {
                          wishlist.removeItem(item.name);
                        },
                        radius: 5,
                        child: SvgPicture.asset(
                          cartDeleteIcon,
                          height: getScreeWidth(20),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${item.size}",
                        style: GoogleFonts.rubik(
                          fontSize: getTextSize(14),
                          fontWeight: FontWeight.w500,
                          color: kLightText,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${item.standardRate}",
                        style: GoogleFonts.rubik(
                          fontSize: getTextSize(14),
                          fontWeight: FontWeight.w500,
                          color: kLightText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          getHorizontalSpace(5),
        ],
      ),
    );
  }
}
