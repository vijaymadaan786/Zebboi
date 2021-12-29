import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/app_text.dart';
import 'package:ehay/constants/assets_path.dart';
import 'package:ehay/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ConditionPage extends StatelessWidget {
  const ConditionPage({Key? key}) : super(key: key);

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
          "Terms & Condition ",
          style: TextStyle(
            color: kDark,
            fontSize: getTextSize(16),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(conditionImage),
              ),
              const TextHeader(text: "Terms & Conditions"),
              const DummyText(text: dummyText4),
              getVerticalSpace(10),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...List.generate(
                        conditionPoints.length,
                        (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    tickIcon,
                                    height: getScreeWidth(15),
                                    color: kPrimary,
                                  ),
                                  getHorizontalSpace(10),
                                  Text(
                                    conditionPoints[index],
                                    maxLines: 2,
                                    style: GoogleFonts.rubik(
                                      fontSize: getTextSize(15),
                                      fontWeight: FontWeight.w400,
                                      color: kDark,
                                      // height: 1.5,
                                    ),
                                  )
                                ],
                              ),
                            ))
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class DummyText extends StatelessWidget {
  const DummyText({
    Key? key,
    this.text,
  }) : super(key: key);
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.rubik(
        fontSize: getTextSize(15),
        fontWeight: FontWeight.w400,
        color: kLightText,
        height: 1.5,
        letterSpacing: 0.3,
      ),
    );
  }
}

class TextHeader extends StatelessWidget {
  const TextHeader({
    Key? key,
    this.text,
  }) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 15),
      child: Text(
        text!,
        style: GoogleFonts.rubik(
          fontSize: getTextSize(17),
          fontWeight: FontWeight.w700,
          color: kDark,
        ),
      ),
    );
  }
}
