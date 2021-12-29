import 'package:cached_network_image/cached_network_image.dart';
import 'package:ehay/constants/api_path.dart';
import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/assets_path.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/controller/cart_list_controller.dart';
import 'package:ehay/module/model/item.dart';
import 'package:ehay/module/view/details/details.dart';
import 'package:ehay/utils/helper/lazy_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ehay/utils/hive_utils.dart' as hive_utils;

class CartItem extends StatefulWidget {
  const CartItem({Key? key, required this.itemMeta}) : super(key: key);
  final dynamic itemMeta;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  CartListController cartController = Get.find();
  Item? item;

  void fetchItem() async {
    var value = await hive_utils.get(widget.itemMeta['itemName']);
    setState(() {
      item = value;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchItem();
  }

  @override
  Widget build(BuildContext context) {
    // CartController cart = Get.find();
    if (item == null) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: CupertinoActivityIndicator(),
      );
    } else {
      return InkWell(
        onTap: () {
          Get.to(() => DetailsPage(item: item as Item));
        },
        child: Container(
          height: getScreenHeight(100),
          width: getScreeWidth(345),
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xffF9F9F9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              // Image.network(item!.productImage!),
              CachedNetworkImage(
                  width: 80,
                  fit: BoxFit.cover,
                  memCacheHeight: 600,
                  memCacheWidth: 600,
                  placeholder: (context, url) => const ShimmerLoader(),
                  errorWidget: (context, url, error) => Image.asset(
                      'assets/images/image_placeholder.jpg',
                      fit: BoxFit.cover),
                  imageUrl: item!.image![0].startsWith("/file")
                      ? baseUrl + item!.image![0]
                      : item!.image![0]),
              getHorizontalSpace(10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        item!.itemName.toString(),
                        maxLines: 2,
                        style: GoogleFonts.rubik(
                          fontSize: getTextSize(14),
                          fontWeight: FontWeight.w400,
                          height: 1.4,
                          color: kDark,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "Quantity: ${widget.itemMeta['qty']} (${widget.itemMeta['variant'].toString().capitalizeFirst})",
                        // "₹${item["standard_rate"]} x ${item["qty"]}",

                        style: GoogleFonts.rubik(
                          fontSize: getTextSize(14),
                          fontWeight: FontWeight.w500,
                          color: kLightText,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "₹${widget.itemMeta['rate']}",
                        // "₹${item["standard_rate"]} x ${item["qty"]}",

                        style: GoogleFonts.rubik(
                          fontSize: getTextSize(14),
                          fontWeight: FontWeight.w500,
                          color: kLightText,
                        ),
                      ),
                      // Text(
                      //   (item['standard_rate'] * item['qty']).toString(),
                      //   style: GoogleFonts.rubik(
                      //     fontSize: getTextSize(14),
                      //     fontWeight: FontWeight.w500,
                      //     color: kLightText,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              getHorizontalSpace(8),
              InkWell(
                onTap: () {
                  cartController.remove(
                      widget.itemMeta['itemName'], widget.itemMeta['variant']);
                },
                radius: 5,
                child: SvgPicture.asset(
                  cartDeleteIcon,
                  height: getScreeWidth(20),
                ),
              ),
              getHorizontalSpace(5),
            ],
          ),
        ),
      );
    }
  }
}
