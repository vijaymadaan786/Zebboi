import 'package:ehay/constants/api_path.dart';
import 'package:ehay/constants/app_color.dart';

import 'package:ehay/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ehay/widgets/custom_button.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//import 'package:ehay/widgets/custom_button.dart';

class DealerPage extends StatefulWidget {
  const DealerPage({Key? key}) : super(key: key);

  @override
  _DealerPageState createState() => _DealerPageState();
}

class _DealerPageState extends State<DealerPage> {
  List<dynamic> data = [];

  Future dealerDetails() async {
    String url = baseUrl + dealerPath;

    final header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "token 0c9f4602e6a6f17:fcdd8001cb61c47",
    };

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: header,
      );

      final responseData = jsonDecode(response.body);

      setState(() {
        data = responseData['data'];
      });

      return response;
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e.toString());
      rethrow;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      rethrow;
    }
  }

  @override
  void initState() {
    super.initState();
    dealerDetails();
  }

  final List<String> _itemsState =
      ['Haryana', 'Goa', 'Gujrat', 'Himachal Pradesh'].toList();
  String _selection = "Haryana";

  final List<String> _itemsCity =
      ['Faridabad', 'Karnal', 'Chandigarh', 'Margao', 'Rajpura', 'Patiala'].toList();
  String _selectionCity = "Faridabad";
  bool list = false;

  @override
  Widget build(BuildContext context) {
    _selection = _itemsState.first;

    final dropdownStateOptions = _itemsState
        .map((String item) =>
            DropdownMenuItem<String>(value: item, child: Text(item)))
        .toList();

    final dropdownCityOptions = _itemsCity
        .map((String item) =>
            DropdownMenuItem<String>(value: item, child: Text(item)))
        .toList();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kAppBgColor,
        appBar: AppBar(
          backgroundColor: kAppBgColor,
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
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: kDark,
              ),
            ),
          ),
          title: Text(
            "Locate Dealer",
            style: TextStyle(
              color: kDark,
              fontSize: getTextSize(16),
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getVerticalSpace(10),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xffeec660), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xffeec660), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  dropdownColor: const Color(0xffeec660),
                  value: _selection,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selection = newValue!;
                    });
                  },
                  items: dropdownStateOptions),
              getVerticalSpace(10),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xffeec660), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xffeec660), width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  dropdownColor: const Color(0xffeec660),
                  value: _selectionCity,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectionCity = newValue!;
                    });
                  },
                  items: dropdownCityOptions),
              getVerticalSpace(10),
              CustomButton(
                text: "Locate",
                press: () {
                  setState(() {
                    list = true;
                  });
                },
              ),
              getVerticalSpace(20),
              list
                  ? Expanded(
                      flex: 20,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: SizedBox(
                              height: 100,
                              child: Card(
                                elevation: 8,
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    // side: const BorderSide(color: Colors.black),
                                  ),
                                  leading: const Icon(
                                    Icons.location_city_rounded,
                                    size: 38,
                                    color: kPrimary,
                                  ),
                                  tileColor: Colors.white,
                                  title:
                                  Text(data[index]['full_name'] ?? ''),
                                  trailing: const Icon(
                                    Icons.call,
                                    size: 33,
                                    color: kPrimary,
                                  ),
                                  subtitle: const Text(
                                    '#203,Sector-19,Faridabad,Haryana',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () =>
                                      FlutterPhoneDirectCaller.callNumber(
                                          data[index]['phone'] ?? ''),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
