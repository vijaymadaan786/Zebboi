import 'package:hive/hive.dart';

// part 'item.g.dart';
part 'bin.g.dart';

@HiveType(typeId: 4)
class Bin extends HiveObject {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? warehouse;
  @HiveField(2)
  final String? itemCode;
  @HiveField(3)
  final String? binType;
  @HiveField(4)
  final double? actualQty;

  Bin({
    this.name,
    this.warehouse,
    this.itemCode,
    this.binType,
    this.actualQty,
  });
}
