// import 'dart:convert';
// import 'dart:io';

// import 'package:ehay/constants/api_path.dart';
// import 'package:ehay/module/controller/cart_controller.dart';
// import 'package:ehay/module/controller/data_controller.dart';
// import 'package:ehay/utils/helper/exception.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// //import '../strapi_payment.dart';

// class Checkout {
//   Checkout._();
//   static final Checkout _instance = Checkout._();
//   static Checkout get instance => _instance;

//   Future<TransactionResponse> makeCheckout() async {
//     CartController cart = Get.find();
//     DataController dataCtrl = Get.find();

//     String url = baseUrl + makeOrder;
//     Uri uri = Uri.parse(url);

//     final payload = {"products": cart.checkoutInfo.toJson()};
//     // ignore: avoid_print
//     print("---:");
//     // ignore: avoid_print
//     print(json.encode(payload));

//     Map<String, String> headers = {'Content-Type': 'application/json'};
//     try {
//       http.Response response = await http.post(
//         uri,
//         body: json.encode(payload),
//         headers: headers,
//       );
//       // print("sc: ${response.statusCode}");

//       if (response.statusCode == 200) {
//         cart.cartItemsList.clear();
//         dataCtrl.getMyOrder();

//         return TransactionResponse(
//           message: response.body,
//           success: true,
//         );
//       } else {
//         return TransactionResponse(
//           message: response.body,
//           success: false,
//         );
//       }
//     } on SocketException {
//       throw FetchDataException('No Internet connection', uri.toString());
//     } catch (e) {
//       debugPrint(e.toString());
//       rethrow;
//     }
//   }
// }
