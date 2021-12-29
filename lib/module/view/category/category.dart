//import 'package:/config/routes/app_routes.dart';
import 'package:ehay/module/model/category.dart';
import 'package:ehay/module/view/category/components/sub_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'components/items.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool isLoading = false;
  List<Category> data = [];

  void fetchData() async {
    var box = await Hive.openBox<Category>('categories');
    // ignore: await_only_futures
    var items = await box.values.where((element) => element.isGroup).toList();
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
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        child: ListView.builder(
            itemCount: data.length,
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 80),
            itemBuilder: (ctx, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: GestureDetector(
                  onTap: () {
                    // appCtrl.searchCategoryItems(data.category[index].name);
                    // Get.to(() => SearchCategoryItems(item_group: data[index]));
                    Get.to(() => SubCategoryPage(
                          category: data[index].name ?? '',
                          categoryImage: data[index].image![0],
                        ));
                    // Get.toNamed(AppRoute.searchPage);
                  },
                  child: CategoryItem(
                    item: data[index],
                  ),
                ),
              );
            }),
      );
    });
  }
}
