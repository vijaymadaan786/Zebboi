import 'package:ehay/constants/api_path.dart';
import 'package:ehay/widgets/home_card_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/size.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderDetail extends StatefulWidget {
  final String itemName;
  const OrderDetail({Key? key, required this.itemName}) : super(key: key);
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  dynamic salesOrder = 0;

  void fetchJSONData() async {
    String url = baseUrl + '/api/resource/Sales Order/' + widget.itemName;
    Uri uri = Uri.parse(url);
    final header = {
      "Authorization": "token 0c9f4602e6a6f17:fcdd8001cb61c47",
    };

    http.Response response = await http.get(uri, headers: header);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body)["data"];
      setState(() {
        salesOrder = responseData;
      });
    } else {
      throw Exception('Failed to load Order details data from internet');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchJSONData();
  }

  Color getColor(status) {
    switch (status) {
      case 'To Deliver':
        return Colors.orange;
      case 'Delivered':
        return Colors.green;
      case 'Cancelled':
        return Colors.red;
      case 'Dispatch':
        return Colors.blue;
      case 'Request for cancel':
        return Colors.orange;
      default:
        return Colors.black;
    }
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
          widget.itemName,
          style: TextStyle(
            color: kDark,
            fontSize: getTextSize(16),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: salesOrder == 0
          ? const Center(child: CupertinoActivityIndicator())
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          'Order details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const HomeCardHeader(text: "Order Date"),
                          const Spacer(),
                          Text(salesOrder['creation'].toString().split(" ")[0]),
                          getHorizontalSpace(10)
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          const HomeCardHeader(text: "Order #"),
                          const Spacer(),
                          Text(salesOrder['name']),
                          getHorizontalSpace(10)
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          const HomeCardHeader(text: "Grand Total"),
                          const Spacer(),
                          Text('₹ ' + salesOrder['grand_total'].toString()),
                          getHorizontalSpace(10)
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          'Shipment details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const HomeCardHeader(text: "Order Status"),
                          const Spacer(),
                          Text(
                            salesOrder['order_status'],
                            style: TextStyle(
                                color: getColor(salesOrder['order_status'])),
                          ),
                          getHorizontalSpace(10)
                        ],
                      ),
                      const Divider(),
                      Row(
                        children: [
                          HomeCardHeader(
                              text: salesOrder['order_status'] == 'Delivered'
                                  ? 'Delivered Date'
                                  : 'Expected Date'),
                          const Spacer(),
                          Text(salesOrder['delivery_date']
                              .toString()
                              .split(" ")[0]),
                          getHorizontalSpace(10)
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          'Order items',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: salesOrder['items'].length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  getHorizontalSpace(15),
                                  Text(salesOrder['items'][index]['item_code']),
                                  const Spacer(),
                                  Text(
                                      'Qty: ${salesOrder['items'][index]['qty']}'),
                                  getHorizontalSpace(10),
                                ],
                              ),
                              HomeCardHeader(
                                  text: salesOrder['items'][index]
                                      ['item_name']),
                              Row(
                                children: [
                                  getHorizontalSpace(15),
                                  Text(
                                      'Rate: ₹ ${salesOrder['items'][index]['rate']}'),
                                ],
                              ),
                              Row(
                                children: [
                                  getHorizontalSpace(15),
                                  Text(
                                      'Amount: ₹ ${salesOrder['items'][index]['amount']}'),
                                ],
                              ),
                              const Divider(),
                            ],
                          );
                        },
                      ),
                      Row(
                        children: [
                          const HomeCardHeader(text: "Total Amount"),
                          const Spacer(),
                          Text(
                            '₹ ' + salesOrder['grand_total'].toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.orange),
                          ),
                          getHorizontalSpace(10)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
