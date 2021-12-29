import 'package:ehay/module/model/item.dart';
import 'package:hive/hive.dart';

Future<List<Item>> getAllItems(
    {String? category,
    String? size,
    String? itemName,
    String? name,
    String? tag,
    String? brand,
    String? color}) async {
  return Future.delayed(const Duration(milliseconds: 1000)).then((value) async {
    final box = await Hive.openBox<Item>('items');
    final data = box.values.where((element) => ((category != null
            ? element.category
                .toString()
                .toLowerCase()
                .contains(category.toLowerCase())
            : true) &&
        (size != null
            ? element.size.toString().toLowerCase().contains(size.toLowerCase())
            : true) &&
        (itemName != null
            ? element.itemName
                .toString()
                .toLowerCase()
                .contains(itemName.toLowerCase())
            : true) &&
        (name != null
            ? element.name.toString().toLowerCase().contains(name.toLowerCase())
            : true) &&
        (tag != null
            ? element.tag.toString().toLowerCase().contains(tag.toLowerCase())
            : true) &&
        (brand != null
            ? element.brand
                .toString()
                .toLowerCase()
                .contains(brand.toLowerCase())
            : true)));
    return data.toList();
  });
}

Future clear() async {
  final box = await Hive.openBox<Item>('items');
  await box.clear();
}

Future<Item?> get(String key) async {
  final box = await Hive.openBox<Item>('items');
  final data = box.get(key);
  // await box.close();
  return data;
}

Future<List<Item>> getItemsBetween(
    {required int from, required int itemslength, String? category}) async {
  String startKey;
  String endKey;
  itemslength = itemslength - 1;
  final box = await Hive.openBox<Item>('items');
  if (from > box.length) {
    return [];
  } else if (from + itemslength > box.length) {
    startKey = box.keyAt(from);
    endKey = box.keyAt(box.length - 1);
  } else {
    startKey = box.keyAt(from);
    endKey = box.keyAt(from + itemslength - 1);
  }
  final data = box.valuesBetween(startKey: startKey, endKey: endKey);
  await box.close();
  return data.toList();
}

Future put(String key, Item item) async {
  final box = await Hive.openBox<Item>('items');
  await box.put(key, item);
  await box.close();
}

Future putAll(String key, Map<dynamic, Item> items) async {
  final box = await Hive.openBox<Item>('items');
  await box.putAll(items);
  await box.close();
}
