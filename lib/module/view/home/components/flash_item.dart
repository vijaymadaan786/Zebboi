import 'package:ehay/constants/api_path.dart';
import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/model/item_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlashItem extends StatelessWidget {
  const FlashItem({
    Key? key,
    this.item,
    this.press,
  }) : super(key: key);
  final ItemModel? item;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: getScreenHeight(150),
        width: getScreeWidth(300),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: const Color(0xffE5E5E5),
            // color: Colors.black,
            width: 0.3,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                item!.image!.startsWith("/file")
                    ? baseUrl + item!.image!
                    : item!.image!,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item!.itemname!,
                        // textAlign: TextAlign.center,
                        maxLines: 3,
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400,
                          fontSize: getTextSize(14),
                          height: 1.5,
                          color: kDark,
                        ),
                      ),
                      getVerticalSpace(15),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.rubik(
                                fontSize: getTextSize(15),
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none,
                                color: kPrimary,
                              ),
                              text: "\$${item!.rate}\t",
                              children: [
                                if (item!.rate != null)
                                  TextSpan(
                                    style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: getTextSize(12),
                                      color: const Color(0xff727272),
                                    ),
                                    text: "\$${item!.rate}",
                                  ),
                              ],
                            ),
                          ),
                          getHorizontalSpace(8),
                          Text(
                            10 > 0 ? "In Stock 10" : "Out Of Stock",
                            style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w500,
                              fontSize: getTextSize(14),
                              color: 10 > 0
                                  ? const Color(0xff01CD53)
                                  : const Color(0xffFF3434),
                            ),
                          ),
                          // Text(
                          //   item!.stockAvailability! > 0
                          //       ? "In Stock (${item!.stockAvailability!})"
                          //       : "Out Of Stock",
                          //   style: GoogleFonts.rubik(
                          //     fontWeight: FontWeight.w500,
                          //     fontSize: getTextSize(14),
                          //     color: item!.stockAvailability! > 0
                          //         ? const Color(0xff01CD53)
                          //         : const Color(0xffFF3434),
                          //   ),
                          // ),
                        ],
                      ),
                      getVerticalSpace(10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
