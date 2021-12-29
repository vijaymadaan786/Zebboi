import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/app_text.dart';
import 'package:ehay/constants/assets_path.dart';
import 'package:ehay/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

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
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: kDark,
            ),
          ),
        ),
        title: Text(
          "About ",
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
                child: Image.asset(aboutImage),
              ),
              const TextHeader(text: "About Us"),
              const DummyText(
                text: dummyText,
              ),
              const TextHeader(text: "Our Mission"),
              const DummyText(text: dummyText2),
              getVerticalSpace(20),
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(missionImage1),
                    ),
                  ),
                  getHorizontalSpace(10),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(missionImage2),
                    ),
                  ),
                ],
              ),
              getVerticalSpace(20),
              const TextHeader(text: "Our Vission"),
              const DummyText(text: dummyText3),
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
