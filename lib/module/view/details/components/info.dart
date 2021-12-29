import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/app_constants.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/model/item.dart';
import 'package:ehay/module/view/details/components/cart_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Info extends StatefulWidget {
  final Item items;
  final double premiumStock;
  final double projectStock;

  const Info({
    Key? key,
    required this.items,
    required this.premiumStock,
    required this.projectStock,
  }) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 15,
            color: Color.fromRGBO(0, 0, 0, 0.05),
          )
        ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // "",
              widget.items.itemName.toString(),
              //data.productDetails.value.itemname!,
              style: GoogleFonts.rubik(
                fontSize: getTextSize(18),
                fontWeight: FontWeight.w500,
                color: kDark,
              ),
            ),
            // getVerticalSpace(10),
            // Row(
            //   children: [
            //     RatingBar.builder(
            //       initialRating: 3,
            //       minRating: 1,
            //       direction: Axis.horizontal,
            //       allowHalfRating: true,
            //       unratedColor: kAppIcon,
            //       itemCount: 5,
            //       itemSize: 16,
            //       itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
            //       itemBuilder: (context, _) => const Icon(
            //         Icons.star,
            //         color: kStar,
            //       ),
            //       onRatingUpdate: (rating) => debugPrint("$rating"),
            //     ),
            //     getHorizontalSpace(5),
            //     Text(
            //       "(325)",
            //       style: TextStyle(
            //         fontSize: getTextSize(14),
            //         color: kLightText,
            //         fontWeight: FontWeight.w400,
            //       ),
            //     ),
            //   ],
            // ),
            // getVerticalSpace(15),

            if (auth.isUserExists.value)
              const Chip(
                label: Text('Premium Rate'),
                backgroundColor: Colors.black12,
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  // "",
                  "₹${widget.items.premiumRate.toString()}",
                  style: TextStyle(
                    fontSize: getTextSize(20),
                    color: kPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (auth.isUserExists.value)
                  CartButton(
                      items: widget.items,
                      variant: 'premium',
                      qty: widget.premiumStock),
              ],
            ),
            getVerticalSpace(10),
            if (auth.isUserExists.value)
              const Chip(
                label: Text('Project Rate'),
                backgroundColor: Colors.black12,
              ),
            if (auth.isUserExists.value)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    // "",
                    "₹${widget.items.standardRate.toString()}",
                    style: TextStyle(
                      fontSize: getTextSize(20),
                      color: kPrimary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (auth.isUserExists.value)
                    CartButton(
                      items: widget.items,
                      variant: 'standard',
                      qty: widget.projectStock,
                    ),
                ],
              ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
