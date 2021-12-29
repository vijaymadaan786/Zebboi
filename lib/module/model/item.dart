import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 0)
class Item extends HiveObject {
  @HiveField(0)
  final String? itemName;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final List<String>? category;
  @HiveField(3)
  final double? standardRate;
  @HiveField(4)
  final double? premiumRate;
  @HiveField(5)
  final List<String>? image;
  @HiveField(6)
  final String? tag;
  @HiveField(7)
  final String? description;
  @HiveField(8)
  final String? size;
  @HiveField(9)
  final String? brand;
  @HiveField(10)
  final String? qty;

  Item({
    this.itemName,
    this.name,
    this.category,
    this.standardRate,
    this.premiumRate,
    this.image,
    this.description,
    this.tag,
    this.size,
    this.brand,
    this.qty,
  });
}
