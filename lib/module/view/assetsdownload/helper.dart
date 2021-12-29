import 'package:ehay/module/model/bin.dart';
import 'package:ehay/module/model/category.dart';
import 'package:ehay/module/model/item.dart';
import 'package:ehay/module/model/tag.dart';
import 'package:ehay/utils/hive_utils.dart' as item_util;
import 'package:ehay/utils/services/api/data_service.dart';
import 'package:hive/hive.dart';

Future<dynamic> syncAllItems() async {
  var itemsInDB = await item_util.getAllItems();
  if (itemsInDB.isEmpty) {
    var data = await DataService.instance.getAllProduct();
    if (data['hasError'] == true && data['error'] != null) {
      String status =
          'Unable to fetch data\nplease check your internet connection';
      return {'status': status, 'hasError': true};
    } else if (data['code'] == 200) {
      for (dynamic item in data['data']) {
        List<String> image = [];
        if (item['image'] is List) {
          image = item['image'];
        } else if (item['image'] != null) {
          image.add(item['image']);
        } else {
          image.add('');
        }
        List<String> category = item['item_category']
            .replaceAll("'", "")
            .replaceAll('[', "")
            .replaceAll(']', "")
            .split(",");
        var hiveitem = Item(
            itemName: item['display_name'],
            category: category,
            image: image,
            name: item['name'],
            standardRate: item['standard_rate'],
            premiumRate: item['premium_rate'],
            size: item['item_size'],
            tag: item['_user_tags'],
            brand: item['brand'],
            description: item['description']);
        await item_util.put(hiveitem.name.toString(), hiveitem);
      }
      return {'status': 'success', 'hasError': false};
    } else {
      String status = 'Unable to fetch data\nERROR_STATUS_CODE_${data["code"]}';
      return {'status': status, 'hasError': true};
    }
  } else {
    return {'status': 'Loading items', 'hasError': false};
  }
}

Future<dynamic> syncAllTags() async {
  var tagBox = await Hive.openBox<Tag>('tags');
  // ignore: await_only_futures
  var tagsInDB = await tagBox.values;
  if (tagsInDB.isEmpty) {
    var data = await DataService.instance.getTags();
    if (data['hasError'] == true && data['error'] != null) {
      String status =
          'Unable to fetch data\nplease check your internet connection';
      return {'status': status, 'hasError': true};
    } else if (data['code'] == 200) {
      for (dynamic item in data['data']) {
        var hiveitem = Tag(
          name: item['name'],
        );
        await tagBox.put(hiveitem.name, hiveitem);
      }
      return {'status': 'success', 'hasError': false};
    } else {
      String status = 'Unable to fetch data\nERROR_STATUS_CODE_${data["code"]}';
      return {'status': status, 'hasError': true};
    }
  } else {
    return {'status': 'Loading items', 'hasError': false};
  }
}

Future<dynamic> syncAllCategory() async {
  var categoryBox = await Hive.openBox<Category>('categories');
  // ignore: await_only_futures
  var categoryInDB = await categoryBox.values;
  if (categoryInDB.isEmpty) {
    var data = await DataService.instance.getCategory();
    if (data['hasError'] == true && data['error'] != null) {
      String status =
          'Unable to fetch data\nplease check your internet connection';
      return {'status': status, 'hasError': true};
    } else if (data['code'] == 200) {
      for (dynamic item in data['data']) {
        List<String> image = [];
        if (item['image'] is List) {
          image = item['image'];
        } else if (item['image'] != null) {
          image.add(item['image']);
        } else {
          image.add('');
        }
        var hiveitem = Category(
            categoryName: item['group_name'],
            isGroup: item['is_group'] == 1 ? true : false,
            name: item['name'],
            image: image,
            parent: item['parent_item_group']);
        await categoryBox.put(hiveitem.name, hiveitem);
        await categoryBox.put(hiveitem.name, hiveitem);
      }
      return {'status': 'success', 'hasError': false};
    } else {
      String status = 'Unable to fetch data\nERROR_STATUS_CODE_${data["code"]}';
      return {'status': status, 'hasError': true};
    }
  } else {
    return {'status': 'Loading items', 'hasError': false};
  }
}

Future<dynamic> syncBin() async {
  var binBox = await Hive.openBox<Bin>('bin');
  // ignore: await_only_futures
  var binInDB = await binBox.values;
  if (binInDB.isEmpty) {
    var data = await DataService.instance.getBin();
    if (data['hasError'] == true && data['error'] != null) {
      String status =
          'Unable to fetch data\nplease check your internet connection';
      return {'status': status, 'hasError': true};
    } else if (data['code'] == 200) {
      for (dynamic item in data['data']) {
        var hiveitem = Bin(
          name: item['name'],
          actualQty: item['actual_qty'],
          itemCode: item['item_code'],
          binType: item['bin_type'],
          warehouse: item['warehouse'],
        );
        await binBox.put(hiveitem.name, hiveitem);
      }
      return {'status': 'success', 'hasError': false};
    } else {
      String status = 'Unable to fetch data\nERROR_STATUS_CODE_${data["code"]}';
      return {'status': status, 'hasError': true};
    }
  } else {
    return {'status': 'Loading items', 'hasError': false};
  }
}
