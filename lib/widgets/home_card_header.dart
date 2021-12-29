import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCardHeader extends StatelessWidget {
  const HomeCardHeader({
    Key? key,
    @required this.text,
    this.trailWidget = const SizedBox(),
  }) : super(key: key);
  final String? text;
  final Widget? trailWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text!,
            style: GoogleFonts.rubik(
              fontSize: getTextSize(15),
              fontWeight: FontWeight.w500,
              letterSpacing: 0.3,
              color: kDark,
            ),
          ),
          SizedBox(child: trailWidget)
        ],
      ),
    );
  }
}
