import 'package:cached_network_image/cached_network_image.dart';
import 'package:ehay/constants/api_path.dart';
import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/model/category.dart';
import 'package:ehay/module/view/category/components/items.dart';
import 'package:ehay/module/view/product/product.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hive/hive.dart';

class SubCategoryPage extends StatefulWidget {
  final String category;
  final String categoryImage;
  const SubCategoryPage(
      {Key? key, required this.category, required this.categoryImage})
      : super(key: key);

  @override
  _SubCategoryPageState createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  List<Category> data = [];
  bool isLoading = false;

  void fetchData() async {
    var box = Hive.box<Category>('categories');
    var items = box.values
        .where((element) => element.parent == widget.category)
        .toList();
    setState(() {
      isLoading = false;
      data = items;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // No appBar property provided, only the body.
      body: CustomScrollView(
          // Add the app bar and list of items as slivers in the next steps.
          slivers: <Widget>[
            SliverAppBar(
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: getScreeWidth(36),
                  width: getScreeWidth(36),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  widget.category,
                  style: const TextStyle(shadows: [
                    Shadow(
                      blurRadius: 25,
                      color: Colors.blueGrey,
                    )
                  ]),
                ),
                background: CachedNetworkImage(
                  memCacheHeight: 800,
                  memCacheWidth: 800,
                  imageUrl: widget.categoryImage.startsWith("/file")
                      ? baseUrl + widget.categoryImage
                      : widget.categoryImage,
                  // imageUrl: '',
                  height: double.infinity,
                  placeholder: (context, url) {
                    return Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.blueGrey.shade500);
                  },
                  errorWidget: (context, url, error) {
                    return Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.blueGrey.shade500);
                  },
                  fit: BoxFit.cover,
                ),
              ),
              expandedHeight: 200,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 10.0, top: 10),
                  child: GestureDetector(
                    onTap: () {
                      // appCtrl.searchCategoryItems(data.category[index].name);
                      // Get.to(() => SearchCategoryItems(item_group: data[index]));
                      Get.to(() =>
                          ProductPage(title: data[index].name.toString()));
                    },
                    child:
                        CategoryItem(item: data[index], title: widget.category),
                  ),
                );
              }, childCount: data.length),
            ),
          ]),
    );
  }
}
