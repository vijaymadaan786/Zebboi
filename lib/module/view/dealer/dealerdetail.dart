import 'package:ehay/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:ehay/constants/app_color.dart';

import 'package:ehay/constants/size.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class DealerDetailsPage extends StatefulWidget {
  const DealerDetailsPage({Key? key}) : super(key: key);
  @override
  _DealerDetailsPageState createState() => _DealerDetailsPageState();
}

class _DealerDetailsPageState extends State<DealerDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: getScreeWidth(70),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            height: getScreeWidth(36),
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
          "Dealer Details",
          style: TextStyle(
            color: kDark,
            fontSize: getTextSize(16),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Column(
            children: [
              getVerticalSpace(5),
              const Divider(),
              getVerticalSpace(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "State",
                    style: GoogleFonts.rubik(
                      fontSize: getTextSize(14),
                      fontWeight: FontWeight.w500,
                      color: kLightText,
                    ),
                  ),
                  Text(
                    "Haryana",
                    style: GoogleFonts.rubik(
                      fontSize: getTextSize(14),
                      fontWeight: FontWeight.w500,
                      color: kDark,
                    ),
                  ),
                ],
              ),
              getVerticalSpace(15),
              const Divider(),
              getVerticalSpace(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "City",
                    style: GoogleFonts.rubik(
                      fontSize: getTextSize(14),
                      fontWeight: FontWeight.w500,
                      color: kLightText,
                    ),
                  ),
                  Text(
                    "Faridabad",
                    style: GoogleFonts.rubik(
                      fontSize: getTextSize(14),
                      fontWeight: FontWeight.w500,
                      color: kDark,
                    ),
                  ),
                ],
              ),
              getVerticalSpace(15),
              const Divider(),
              getVerticalSpace(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Contact",
                    style: GoogleFonts.rubik(
                      fontSize: getTextSize(14),
                      fontWeight: FontWeight.w500,
                      color: kLightText,
                    ),
                  ),
                  Text(
                    "+91123456789",
                    style: GoogleFonts.rubik(
                      fontSize: getTextSize(14),
                      fontWeight: FontWeight.w500,
                      color: kDark,
                    ),
                  ),
                ],
              ),
              getVerticalSpace(15),
              const Divider(),
              getVerticalSpace(15),
              getVerticalSpace(10),
              CustomButton(
                text: "Contact us",
                press: () {
                  setState(() {});
                },
              ),
              getVerticalSpace(20),
            ],
          )
        ],
      ),
    );
  }
}
