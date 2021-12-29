import 'package:ehay/module/model/item.dart';
import 'package:ehay/module/view/details/details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearch extends SearchDelegate {
  List<Item> data = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (data.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = "";
          },
        )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // var searchBox = Hive.box<Item>('items');
    return IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final list = query.isEmpty
        ? []
        : data
            .where(
                (p) => p.itemName!.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return Column(
      children: [
        if (query.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${list.length} Result(s) found",
            ),
          ),
        Expanded(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 2,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  horizontalTitleGap: 5,
                  title: Text(
                    "${list[index].itemName}",
                  ),
                  trailing: const Icon(Icons.search),
                  onTap: () {
                    Get.to(() => DetailsPage(item: list[index]));
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
