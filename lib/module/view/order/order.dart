import 'package:ehay/constants/api_path.dart';
import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/controller/auth_controller.dart';
import 'package:ehay/module/view/others/orderdetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderPage extends StatefulWidget {
  final Function? handleRemove;
  const OrderPage({
    Key? key,
    this.handleRemove,
  }) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<dynamic> users = [];
  bool isLoading = true;
  bool isError = false;
  AuthController auth = Get.find();

  Future<void> fetchJSONData() async {
    String url = baseUrl +
        salesOrderPath +
        '&filters=[["customer","=","${auth.data['customer']}"]]';

    Uri uri = Uri.parse(url);
    final header = {
      "Authorization": "token 0c9f4602e6a6f17:fcdd8001cb61c47",
    };

    http.Response response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      final responseData =
          jsonDecode(response.body)["data"].cast<Map<String, dynamic>>();
      setState(() {
        users = responseData;
        isLoading = false;
      });
    } else {
      setState(() {
        isError = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchJSONData();
  }

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
          "Order History",
          style: TextStyle(
              color: kDark,
              fontSize: getTextSize(26),
              fontWeight: FontWeight.w900,
              fontFamily: 'GalaxyBT'),
        ),
      ),
      body: !isLoading && users.isEmpty
          ? const Center(child: Text('No sales order'))
          : isError
              ? const Center(child: Text('Internet connection error'))
              : isLoading
                  ? const Center(child: CupertinoActivityIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(2),
                          child: SizedBox(
                            height: 100,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(.5),
                                    blurRadius: 20.0,
                                    spreadRadius: 0.0,
                                    offset: const Offset(
                                      5.0,
                                      5.0,
                                    ),
                                  )
                                ],
                              ),
                              child: Card(
                                shadowColor: Colors.black,
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ListTile(
                                      leading: const Icon(
                                        Icons.add_shopping_cart_sharp,
                                        color: kPrimary,
                                      ),
                                      trailing: Text(users[index]["grand_total"]
                                          .toString()),
                                      subtitle: Column(
                                        children: [
                                          Text(users[index]["delivery_date"] ??
                                              'Not specified yet'),
                                          Text(users[index]["order_status"]
                                              .toString()),
                                        ],
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                      ),
                                      tileColor: kAppBgColor,
                                      title: Text(users[index]["name"]),
                                      onTap: () {
                                        Get.to(() => OrderDetail(
                                            itemName: users[index]["name"]));
                                      }),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
    );
  }
}
