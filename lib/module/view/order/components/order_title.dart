import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/size.dart';
import 'package:flutter/material.dart';

class OrderIndex extends StatelessWidget {
  const OrderIndex({
    Key? key,
    required this.orderDate,
  }) : super(key: key);

  final String? orderDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenHeight(35),
      width: getScreeWidth(85),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Text(
        orderDate!,
        style: TextStyle(
          fontSize: getTextSize(14),
          fontWeight: FontWeight.w600,
          color: kDark,
        ),
      ),
    );
  }
}
