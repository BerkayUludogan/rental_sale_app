// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_brand_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BaseBrandModelAdapter extends TypeAdapter<BaseBrandModel> {
  @override
  final int typeId = 80;

  @override
  BaseBrandModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BaseBrandModel(
      id: fields[0] as String?,
      brand: fields[1] as String?,
      color: fields[2] as String?,
      price: fields[3] as String?,
      year: fields[4] as int?,
      isFavorite: fields[5] as bool?,
      isSold: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, BaseBrandModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.brand)
      ..writeByte(2)
      ..write(obj.color)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.year)
      ..writeByte(5)
      ..write(obj.isFavorite)
      ..writeByte(6)
      ..write(obj.isSold);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseBrandModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
