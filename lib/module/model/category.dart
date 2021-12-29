import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 1)
class Category extends HiveObject {
  @HiveField(0)
  final String? categoryName;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final bool isGroup;
  @HiveField(3)
  final List<String>? image;
  @HiveField(4)
  final String? parent;

  Category(
      {this.categoryName,
      this.name,
      required this.isGroup,
      this.image,
      this.parent});
}
