import 'package:ehay/constants/app_color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountText extends StatelessWidget {
  const AccountText({Key? key, this.text, this.authText, this.press})
      : super(key: key);
  final String? text;
  final String? authText;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$text\t\t",
        style: Get.textTheme.subtitle2!.copyWith(
          color: kAppIcon,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: authText,
            recognizer: TapGestureRecognizer()..onTap = press,
            style: Get.textTheme.subtitle2!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
