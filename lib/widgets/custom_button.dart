import 'package:ehay/constants/app_constants.dart';
import 'package:ehay/constants/size.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenHeight(45),
      width: getScreeWidth(335),
      decoration: BoxDecoration(
          gradient: gradientColor, borderRadius: BorderRadius.circular(4)),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onSurface: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          text!,
          style: TextStyle(
            fontSize: getTextSize(16),
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}
