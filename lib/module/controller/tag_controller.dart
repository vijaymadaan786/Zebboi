import 'package:ehay/module/model/tag.dart';
import 'package:get/state_manager.dart';
import 'package:hive/hive.dart';

class TagController extends GetxController {
  RxList tags = [].obs;

  @override
  void onInit() async {
    var box = Hive.box<Tag>('tags');
    var tagsList = box.values;
    tags.addAll(tagsList);
    update();
    super.onInit();
  }
}
