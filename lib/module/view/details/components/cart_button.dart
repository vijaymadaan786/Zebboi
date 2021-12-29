import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/app_constants.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/controller/cart_list_controller.dart';
import 'package:ehay/module/model/item.dart';
import 'package:ehay/utils/helper/show_snack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CartButton extends StatefulWidget {
  final Item items;
  final String variant;
  final double qty;
  // final double premiumStock;
  // final double standardStock;
  const CartButton(
      {Key? key,
      required this.items,
      required this.variant,
      // required this.premiumStock,
      required this.qty})
      : super(key: key);

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  CartListController cartController = Get.find();

  int count = 0;

  @override
  void initState() {
    print(widget.qty);
    super.initState();
    var item = cartController.itemsMeta
        .toList()
        .where((element) =>
            element['itemName'] == widget.items.name &&
            element['variant'] == widget.variant)
        .toList();
    if (item.isNotEmpty) {
      setState(() {
        count = item[0]['qty'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _quantity = TextEditingController();
    late int value2;

    _showDialog(String? name) {
      showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 200),
        context: context,
        pageBuilder: (_, __, ___) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: AlertDialog(
              //  contentPadding: const EdgeInsets.all(16.0),
              content: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: _quantity,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        value2 = int.parse(value);
                      },
                      autofocus: true,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: kPrimary,
                          )),
                          labelStyle: TextStyle(color: Colors.black),
                          labelText: 'Quantity',
                          hoverColor: kPrimary,
                          hintText: 'eg. 20'),
                    ),
                  )
                ],
              ),
              actions: <Widget>[
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: kPrimary),
                    child: const Text('CANCEL'),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: kPrimary),
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        count = value2;
                      });
                      if (count == 0) {
                        cartController.remove(
                            widget.items.name, widget.variant);
                        return;
                      }
                      cartController.add(
                          widget.items.name,
                          count,
                          widget.variant == 'standard'
                              ? widget.items.standardRate
                              : widget.items.premiumRate,
                          widget.variant);
                    })
              ],
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          // RetryClient(data)
          return SlideTransition(
            transformHitTests: true,
            position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
                .animate(anim),
            child: child,
          );
        },
      );
    }

    return count > 0
        ? Container(
            height: getScreenHeight(50),
            width: 140,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(5),
                bottom: Radius.circular(5),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -2),
                  spreadRadius: 0,
                  blurRadius: 15,
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                )
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                gradient: gradientColor,
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (count > 1) {
                        setState(() {
                          count--;
                        });
                        cartController.add(
                            widget.items.name,
                            count,
                            widget.variant == 'standard'
                                ? widget.items.standardRate
                                : widget.items.standardRate,
                            widget.variant);
                      } else {
                        setState(() {
                          count = 0;
                        });
                        cartController.remove(
                            widget.items.name, widget.variant);
                        SnackMessage.instance
                            .showSnack(message: 'Item removed from cart');
                      }
                    },
                    child: Container(
                      height: getScreeWidth(25),
                      width: getScreeWidth(25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(
                        Icons.remove,
                        size: 15,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _showDialog(count.toString()),
                    child: Text(
                      count.toString(),
                      style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: getTextSize(18),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        count++;
                      });
                      cartController.add(
                          widget.items.name,
                          count,
                          widget.variant == 'standard'
                              ? widget.items.standardRate
                              : widget.items.premiumRate,
                          widget.variant);
                    },
                    child: Container(
                      height: getScreeWidth(25),
                      width: getScreeWidth(25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : SizedBox(
            // width: getScreeWidth(100),
            height: getScreenHeight(50),
            width: 140,
            child: ElevatedButton(
                child: const Text("Add To Cart"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kPrimary)),
                onPressed: widget.qty.isEqual(0)
                    ? null
                    : () {
                        SnackMessage.instance
                            .showSnack(message: 'Item added to cart');
                        setState(() {
                          count++;
                        });
                        cartController.add(
                            widget.items.name,
                            count,
                            widget.variant == 'standard'
                                ? widget.items.standardRate
                                : widget.items.standardRate,
                            widget.variant);
                      }),
          );
  }
}
