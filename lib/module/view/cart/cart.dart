import 'package:ehay/config/routes/app_routes.dart';
import 'package:ehay/constants/api_path.dart';
import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/assets_path.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/controller/auth_controller.dart';
import 'package:ehay/module/controller/cart_list_controller.dart';
import 'package:ehay/module/view/cart/components/cart_amount_card.dart';
import 'package:ehay/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/cart_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController auth = Get.find();
    CartListController cartController = Get.put(CartListController());

    Future<dynamic> createSalesOrder() async {
      String url = baseUrl + "/api/resource/Sales Order";
      List<dynamic> items = [];
      for (var item in cartController.itemsMeta) {
        items.add({
          'item_code': item['itemName'],
          'qty': item['qty'],
          'rate': item['rate'],
        });
      }
      final payload = json.encode(
          {'customer': auth.data['customer'], "items": items, 'docstatus': 1});
      Uri uri = Uri.parse(url);
      final header = {
        "Authorization": "token 0c9f4602e6a6f17:fcdd8001cb61c47",
      };

      try {
        http.Response response =
            await http.post(uri, headers: header, body: payload);
        if (response.statusCode == 200) {
          EasyLoading.showSuccess("Order Created Successfully");
          final responseData = jsonDecode(response.body)["data"];
          cartController.clearCart();
          // handleRemove(widget.item);
          // ignore: avoid_print
          print(responseData);
        }
      } catch (e) {
        rethrow;
      }
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Obx(() {
            return Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (cartController.itemsMeta.isEmpty)
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            cartIcon,
                            height: 50,
                          ),
                          getVerticalSpace(15),
                          Text(
                            "Empty",
                            style: GoogleFonts.rubik(
                              fontSize: getTextSize(18),
                              color: kLightText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (cartController.itemsMeta.isNotEmpty)
                  SizedBox(
                    height: constraints.maxHeight - constraints.maxHeight * 0.2,
                    child: ListView(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 15, bottom: 15),
                      children: [
                        ...List.generate(
                          cartController.itemsMeta.length,
                          (index) => CartItem(
                            itemMeta: cartController.itemsMeta[index],
                          ),
                        ),
                        CartAmountCard(
                          item: cartController.itemsMeta,
                        ),
                      ],
                    ),
                  ),
                if (cartController.itemsMeta.isNotEmpty)
                  Center(
                    child: CustomButton(
                      press: () {
                        createSalesOrder();
                        // Get.toNamed(AppRoute.orderPage);
                      },
                      text: "Proceed To Checkout",
                    ),
                  ),
              ],
            );
          }),
        );
      },
    );
  }
}
