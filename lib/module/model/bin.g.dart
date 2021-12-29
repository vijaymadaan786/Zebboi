// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bin.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BinAdapter extends TypeAdapter<Bin> {
  @override
  final int typeId = 4;

  @override
  Bin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bin(
      name: fields[0] as String?,
      warehouse: fields[1] as String?,
      itemCode: fields[2] as String?,
      binType: fields[3] as String?,
      actualQty: fields[4] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Bin obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.warehouse)
      ..writeByte(2)
      ..write(obj.itemCode)
      ..writeByte(3)
      ..write(obj.binType)
      ..writeByte(4)
      ..write(obj.actualQty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BinAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
