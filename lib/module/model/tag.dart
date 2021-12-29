import 'package:hive/hive.dart';

// part 'category.g.dart';
part 'tag.g.dart';

@HiveType(typeId: 3)
class Tag extends HiveObject {
  @HiveField(0)
  final String? name;

  Tag({
    this.name,
  });
}
