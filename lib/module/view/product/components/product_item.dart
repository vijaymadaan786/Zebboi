import 'dart:async';

import 'package:ehay/constants/app_color.dart';
import 'package:ehay/constants/size.dart';
import 'package:ehay/module/controller/filter_controller.dart';
import 'package:ehay/module/model/item.dart';
import 'package:ehay/module/view/details/details.dart';

import 'package:ehay/utils/hive_utils.dart';
import 'package:ehay/widgets/home_card_header.dart';
import 'package:ehay/widgets/product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItemList extends StatefulWidget {
  final String? category;
  final String? size;
  final String? tag;
  const ProductItemList({Key? key, this.category, this.size, this.tag})
      : super(key: key);
  @override
  _ProductItemListState createState() => _ProductItemListState();
}

class _ProductItemListState extends State<ProductItemList> {
  Timer _debounce = Timer(const Duration(milliseconds: 300), () {});
  FilterController filterController = Get.find();
  bool isLoading = true;
  var usedFiltersCount = 0;
  List<Item> data = [];
  // List<String> usedFiltes = [];

  void getItems(
      {String? category,
      String? size,
      String? itemName,
      String? name,
      String? tag,
      String? brand,
      String? color}) async {
    setState(() {
      isLoading = true;
      data = [];
    });
    var items = await getAllItems(
        category: category,
        size: size,
        itemName: itemName,
        name: name,
        tag: tag,
        brand: brand,
        color: color);
    setState(() {
      data = items;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.size != null) {
      filterController.size.value = widget.size!;
      filterController.updateUsedFiltersCount();
      getItems(size: widget.size);
      return;
    } else if (widget.tag != null) {
      filterController.tag.value = widget.tag!;
      filterController.updateUsedFiltersCount();
      getItems(tag: widget.tag);
      return;
    } else if (widget.category != null) {
      filterController.category.value = widget.category!;
      filterController.updateUsedFiltersCount();
      getItems(category: widget.category);
      return;
    } else {
      getItems();
    }
  }

  @override
  void dispose() {
    filterController.resetFilters();
    _debounce.cancel();
    super.dispose();
  }

  _onSearchChanged(String query) {
    if (_debounce.isActive) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      getItems(
          itemName: query,
          category: filterController.category.value == 'None'
              ? null
              : filterController.category.value,
          size: filterController.size.value == 'None'
              ? null
              : filterController.size.value,
          tag: filterController.tag.value == 'None'
              ? null
              : filterController.tag.value,
          brand: filterController.brand.value == 'None'
              ? null
              : filterController.brand.value,
          color: filterController.color.value == 'None'
              ? null
              : filterController.color.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: filterController.isSearch.value ? 1 : 0,
            // scale: disableSearch ? 0 : 1,
            child: Container(
              height: filterController.isSearch.value ? getScreeWidth(60) : 0,
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: CupertinoTextField(
                placeholder: 'Search...',
                onChanged: _onSearchChanged,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black26),
                ),
                padding: const EdgeInsets.all(10),
              ),
            ),
          );
        }),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.topRight,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: usedFiltersCount != 0 ? kPrimary : Colors.black26,
              ),
              primary: usedFiltersCount != 0 ? kPrimary : Colors.black45,
            ),
            child: Text(
                'Filters${usedFiltersCount != 0 ? ' (' + usedFiltersCount.toString() + ')' : ''}'),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (_) => FilterBottomSheet(onApply: () {
                  setState(() {
                    usedFiltersCount = filterController.usedFiltersCount.value;
                  });
                  getItems(
                      category: filterController.category.value == 'None'
                          ? null
                          : filterController.category.value,
                      size: filterController.size.value == 'None'
                          ? null
                          : filterController.size.value,
                      tag: filterController.tag.value == 'None'
                          ? null
                          : filterController.tag.value,
                      brand: filterController.brand.value == 'None'
                          ? null
                          : filterController.brand.value,
                      color: filterController.color.value == 'None'
                          ? null
                          : filterController.color.value);
                }),
              );
            },
          ),
        ),
        Builder(builder: (context) {
          if (data.isEmpty && !isLoading) {
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
            return Column(
              children: [
                GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    itemCount: data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.68,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (ctx, index) {
                      return ProductItem(
                        item: data[index],
                        press: () {
                          Get.to(() => DetailsPage(item: data[index]));
                        },
                      );
                    }),
                if (isLoading) const Center(child: CupertinoActivityIndicator())
              ],
            );
          }
        }),
      ],
    );
  }
}

class FilterBottomSheet extends StatefulWidget {
  final Function onApply;
  const FilterBottomSheet({Key? key, required this.onApply}) : super(key: key);

  @override
  _FilterBottomSheetState createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  FilterController filterController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Obx(() {
          return ListView(children: [
            Row(
              children: [
                const HomeCardHeader(text: 'Apply filters'),
                const Spacer(),
                TextButton(
                    style: TextButton.styleFrom(primary: Colors.red),
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: () {
                      widget.onApply();
                      Get.back();
                    },
                    child: const Text('Apply'))
              ],
            ),
            const Divider(),
            Row(
              children: [
                const HomeCardHeader(text: "Size"),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.black26,
                      width: 1,
                    ),
                  ),
                  child: DropdownButton(
                    items: filterController.sizeList.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (value) {
                      filterController.size.value = value.toString();
                      filterController.updateUsedFiltersCount();
                    },
                    value: filterController.size.value,
                    underline: Container(),
                  ),
                ),
                getHorizontalSpace(10)
              ],
            ),
            const Divider(
              thickness: 1,
              color: Colors.black12,
            ),
            Row(
              children: [
                const HomeCardHeader(text: "Brand"),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.black26,
                      width: 1,
                    ),
                  ),
                  child: DropdownButton(
                    items: filterController.brandList.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                    onChanged: (value) {
                      filterController.brand.value = value.toString();
                      filterController.updateUsedFiltersCount();
                    },
                    value: filterController.brand.value,
                    underline: Container(),
                  ),
                ),
                getHorizontalSpace(10)
              ],
            ),
            const Divider(
              thickness: 1,
              color: Colors.black12,
            ),
          ]);
        }));
  }
}
