import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/view/details/details.dart';
import 'package:ehay/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchCategoryItems extends StatefulWidget {
  final dynamic itemGroup;
  const SearchCategoryItems({Key? key, required this.itemGroup})
      : super(key: key);

  @override
  _SearchCategoryItemsState createState() => _SearchCategoryItemsState();
}

class _SearchCategoryItemsState extends State<SearchCategoryItems> {
  // Map<String, dynamic> cat = new Map<String, dynamic>();
  // List<dynamic> cat = [];
  GetStorage boxes = GetStorage();

  bool isLoading = true;

  // Future<void> fetchJSONData() async {
  //   String url = baseUrl +
  //       productUrl +
  //       '&filters=[["item_group","=","${widget.item_group}"]]';
  //   Uri uri = Uri.parse(url);

  //   final header = {
  //     "Authorization": "token 0c9f4602e6a6f17:fcdd8001cb61c47",
  //   };
  //   http.Response response = await http.get(uri, headers: header);
  //   if (response.statusCode == 200) {
  //     List<dynamic> responseData =
  //         jsonDecode(response.body)["data"] as List<dynamic>;

  //     final _list = <ItemModel>[];

  //     responseData.forEach((e) {
  //       final data = ItemModel.fromJson(e);
  //       _list.add(data);
  //     });

  //     setState(() {
  //       cat = _list;
  //       isLoading = false;
  //     });
  //   } else {
  //     throw Exception('Failed to load Category data from internet');
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   fetchJSONData();
  // }

  List<dynamic> cat = [];

  void getItemByGroup(itemGroup) {
    List<dynamic> items = boxes.read("hive");
    for (var element in items) {
      // print(item_group);
      // print(element['item_group']);
      if (element['item_group'] == itemGroup) {
        cat.add(element);
      }
    }
    // print(cat);
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    getItemByGroup(widget.itemGroup['name']);
  }

  @override
  Widget build(BuildContext context) {
    // print(cat[0]['name']);

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
          "Related Products",
          style: TextStyle(
            color: kDark,
            fontSize: getTextSize(16),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Builder(builder: (BuildContext context) {
        if (isLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: kPrimary,
            strokeWidth: 4.0,
          ));
        }
        if (cat.isEmpty && !isLoading) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Products Not Available!",
                style: GoogleFonts.rubik(
                  fontSize: getTextSize(14),
                  color: kLightText,
                ),
              ),
            ),
          );
        } else {
          return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              itemCount: cat.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (ctx, index) {
                return Container(
                  height: getScreenHeight(175),
                  width: getScreeWidth(165),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: const BoxDecoration(
                    color: Color(0xffFFFFFF),
                  ),
                  child: ProductItem(
                    item: cat[index],
                    press: () {
                      // data.productDetails(cat[index]);
                      // Get.toNamed(AppRoute.detailsPage);
                      Get.to(() => DetailsPage(item: cat[index]));
                    },
                  ),
                );
              });
        }
      }),
    );
  }
}
