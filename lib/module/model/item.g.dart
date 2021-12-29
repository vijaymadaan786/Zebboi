// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemAdapter extends TypeAdapter<Item> {
  @override
  final int typeId = 0;

  @override
  Item read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Item(
      itemName: fields[0] as String?,
      name: fields[1] as String?,
      category: (fields[2] as List?)?.cast<String>(),
      standardRate: fields[3] as double?,
      premiumRate: fields[4] as double?,
      image: (fields[5] as List?)?.cast<String>(),
      description: fields[7] as String?,
      tag: fields[6] as String?,
      size: fields[8] as String?,
      brand: fields[9] as String?,
      qty: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.itemName)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.standardRate)
      ..writeByte(4)
      ..write(obj.premiumRate)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.tag)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.size)
      ..writeByte(9)
      ..write(obj.brand)
      ..writeByte(10)
      ..write(obj.qty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
