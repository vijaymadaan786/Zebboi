import 'package:cached_network_image/cached_network_image.dart';
import 'package:ehay/constants/api_path.dart';
import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/app_constants.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/model/item.dart';
import 'package:ehay/module/model/item_model.dart';
import 'package:ehay/utils/helper/lazy_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ehay/module/model/bin.dart';
import 'package:hive/hive.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    Key? key,
    this.item,
    this.latest,
    this.widthSize = 0,
    this.press,
  }) : super(key: key);

  final double? widthSize;
  final Item? item;
  final VoidCallback? press;
  final ItemModel? latest;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  double premiumStock = 0;
  double projectStock = 0;

  fetchStock() async {
    var binBox = await Hive.openBox<Bin>('bin');
    var bin = binBox.values
        .where((element) => element.itemCode == widget.item!.name)
        .toList();
    if (bin.isNotEmpty && mounted) {
      for (var element in bin) {
        if (element.binType == 'Premium') {
          setState(() {
            premiumStock += element.actualQty!;
          });
        } else {
          setState(() {
            projectStock += element.actualQty!;
          });
        }
      }
    }
  }

  @override
  void initState() {
    fetchStock();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      child: Material(
        // elevation: 2,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffE5E5E5),
                width: 0.3,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    memCacheHeight: 600,
                    memCacheWidth: 600,
                    // fit: BoxFit.cover,
                    imageUrl: widget.item!.image![0].startsWith("/file")
                        ? baseUrl + widget.item!.image![0]
                        : widget.item!.image![0],
                    height: getScreenHeight(130),
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const ShimmerLoader(),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/image_placeholder.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: -15,
                    child: Visibility(
                      // visible: item!.newArrival!,
                      visible: false,
                      child: ClipPath(
                        clipper: HexagonalClipper(reverse: true),
                        child: Container(
                          height: 45,
                          width: 33,
                          color: kPrimary,
                          child: Center(
                            child: Text(
                              "New",
                              style: GoogleFonts.rubik(
                                color: const Color(0xffFFFFFF),
                                fontSize: getTextSize(12),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // getVerticalSpace(5),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item!.itemName.toString(),
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      style: GoogleFonts.rubik(
                        fontWeight: FontWeight.w400,
                        fontSize: getTextSize(12),
                        height: 1.4,
                        letterSpacing: 0.3,
                        color: kDark,
                      ),
                    ),
                    getVerticalSpace(4),
                    Row(
                      children: const [
                        // RatingBar.builder(
                        //   initialRating: 2,
                        //   minRating: 1,
                        //   direction: Axis.horizontal,
                        //   allowHalfRating: true,
                        //   unratedColor: kAppIcon,
                        //   itemCount: 5,
                        //   itemSize: 12,
                        //   itemPadding:
                        //       const EdgeInsets.symmetric(horizontal: 1.0),
                        //   itemBuilder: (context, _) => const Icon(
                        //     Icons.star,
                        //     color: kStar,
                        //   ),
                        //   onRatingUpdate: (rating) => debugPrint("$rating"),
                        // ),
                        // getHorizontalSpace(5),
                        // Text(
                        //   '325',
                        //   style: TextStyle(
                        //     fontSize: getTextSize(10),
                        //     color: kLightText,
                        //     fontWeight: FontWeight.w400,
                        //   ),
                        // ),
                      ],
                    ),
                    if (!auth.isUserExists.value)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Rate",
                            // item!.title!,
                            //item!.itemname!,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w400,
                              fontSize: getTextSize(10),
                              // height: 1.4,
                              letterSpacing: 0.3,
                              color: kDark,
                            ),
                          ),

                          const SizedBox(
                            width: 10,
                          ),
                          // if (auth.isUserExists.value)
                          //   Transform(
                          //     transform: Matrix4.identity()..scale(0.8),
                          //     child: const Chip(
                          //       label: Text(
                          //         'Premium',
                          //         overflow: TextOverflow.ellipsis,
                          //       ),
                          //       backgroundColor: Colors.black12,
                          //     ),
                          //   ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.rubik(
                                fontSize: getTextSize(13),
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none,
                                color: kPrimary,
                              ),
                              text: "₹${widget.item!.premiumRate.toString()}",
                            ),
                          ),
                        ],
                      ),
                    // getVerticalSpace(5),
                    if (auth.isUserExists.value)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          if (auth.isUserExists.value)
                            Text(
                              "Premium Stock",
                              // item!.title!,
                              //item!.itemname!,
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w400,
                                fontSize: getTextSize(10),
                                // height: 1.4,
                                letterSpacing: 0.3,
                                color: kDark,
                              ),
                            ),
                          if (auth.isUserExists.value)
                            const SizedBox(
                              width: 10,
                            ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: GoogleFonts.rubik(
                                  fontSize: getTextSize(13),
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none,
                                  color: kPrimary,
                                ),
                                // text: premiumStock.toString() + ' ' + 'pcs',
                                text: premiumStock.toInt() == 0
                                    ? 'Out of stock'
                                    : premiumStock.toInt().toString() +
                                        ' ' +
                                        'pieces'),
                          ),
                        ],
                      ),
                    getVerticalSpace(5),
                    if (auth.isUserExists.value)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Project Stock",
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w400,
                              fontSize: getTextSize(10),
                              // height: 1.4,
                              letterSpacing: 0.3,
                              color: kDark,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: GoogleFonts.rubik(
                                  fontSize: getTextSize(13),
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.none,
                                  color: kPrimary,
                                ),
                                // text: projectStock.toString() + ' ' + 'pcs',
                                text: projectStock.toInt() == 0
                                    ? 'Out of stock'
                                    : projectStock.toInt().toString() +
                                        ' ' +
                                        'pieces'),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
