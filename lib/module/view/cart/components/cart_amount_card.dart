import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartAmountCard extends StatelessWidget {
  final dynamic item;
  const CartAmountCard({Key? key, this.item}) : super(key: key);

  double get cartTotal =>
      item.fold(0.0, (sum, element) => sum + element["qty"] * element["rate"]);

  @override
  Widget build(BuildContext context) {
    //  CartController cart = Get.find();
    //print(item["standard_rate"].toString());
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cart Total: ",
            style: GoogleFonts.rubik(
              fontSize: getTextSize(18),
              fontWeight: FontWeight.w500,
              color: kDark,
            ),
          ),
          getVerticalSpace(10),
          TotalCard(
            text: "Sub Total",
            amount: cartTotal,
          ),
          // const TotalCard(
          //   text: "Shipping",
          //   amount: 15,
          // ),

          getVerticalSpace(20),
          Container(
            height: getScreenHeight(50),
            width: getScreeWidth(315),
            decoration: BoxDecoration(
              color: kDark,
              borderRadius: BorderRadius.circular(6),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Payable Total: ",
                  style: GoogleFonts.rubik(
                    fontSize: getTextSize(15),
                    fontWeight: FontWeight.w500,
                    color: const Color(0xffCFCFCF),
                  ),
                ),
                Text(
                  cartTotal.toString(),
                  style: GoogleFonts.rubik(
                    fontSize: getTextSize(15),
                    fontWeight: FontWeight.w700,
                    color: const Color(0xffFFFFFF),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TotalCard extends StatelessWidget {
  const TotalCard({
    Key? key,
    this.text,
    this.amount,
  }) : super(key: key);
  final String? text;
  final double? amount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$text :",
            style: const TextStyle(
              // fontSize: getTextSize(12),
              fontWeight: FontWeight.w400,
              color: Color(0xff868686),
            ),
          ),
          Text(
            "$amount",
            style: const TextStyle(
              // fontSize: getTextSize(14),
              fontWeight: FontWeight.w600,
              color: Color(0xff868686),
            ),
          ),
        ],
      ),
    );
  }
}
