import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/assets_path.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/model/my_order_model.dart';
import 'package:ehay/module/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TotalAndEmail extends StatelessWidget {
  const TotalAndEmail({
    Key? key,
    required this.element,
  }) : super(key: key);

  final MyOrderModel? element;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                  text: 'Total: ',
                  style: TextStyle(
                    fontSize: getTextSize(20),
                    fontWeight: FontWeight.w600,
                    color: kDark,
                  ),
                  children: [
                    TextSpan(
                      text: '\$${element!.totalPrice}',
                      style: TextStyle(
                        fontSize: getTextSize(20),
                        fontWeight: FontWeight.w600,
                        color: kPrimary,
                      ),
                    )
                  ]),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerRight,
              height: getScreenHeight(35),
              child: FittedBox(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    emailIcon,
                    color: kDark.withOpacity(0.5),
                  ),
                  label: Text(
                    '${element!.email}',
                    style: TextStyle(
                      color: kDark.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ProductModel? item;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      horizontalTitleGap: 10,
      minVerticalPadding: 10,
      // minLeadingWidth: 60,
      tileColor: const Color(0xffF9F9F9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(item!.productFrontImg!.url!
            ),
      ),
      title:  Text(
        "${item!.title}",
        style:  TextStyle(fontWeight: FontWeight.w500,
        fontSize: getTextSize(14),
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: RichText(
          text:  TextSpan(
              text: '\$${item!.price}',
              style:   TextStyle(color: kPrimary,
              fontWeight: FontWeight.w600,
                fontSize: getTextSize(14),
              ),
              children: const [
                // TextSpan(
                //   text: ' x 2 pc',
                //   style: TextStyle(
                //     color: kLightText,
                //   ),
                // )
              ]),
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 5),
    );
  }
}
