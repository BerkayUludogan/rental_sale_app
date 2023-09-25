// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bicycle_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BicycleModelAdapter extends TypeAdapter<BicycleModel> {
  @override
  final int typeId = 72;

  @override
  BicycleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BicycleModel(
      wheelSize: fields[9] as String?,
      frameSize: fields[10] as String?,
      frameType: fields[11] as String?,
      frontBrake: fields[12] as String?,
      rearBrake: fields[13] as String?,
      numberOfGears: fields[14] as String?,
      id: fields[0] as String?,
      brand: fields[1] as String?,
      color: fields[2] as String?,
      price: fields[3] as String?,
      year: fields[4] as int?,
      isSold: fields[6] as bool,
    )..isFavorite = fields[5] as bool?;
  }

  @override
  void write(BinaryWriter writer, BicycleModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(9)
      ..write(obj.wheelSize)
      ..writeByte(10)
      ..write(obj.frameSize)
      ..writeByte(11)
      ..write(obj.frameType)
      ..writeByte(12)
      ..write(obj.frontBrake)
      ..writeByte(13)
      ..write(obj.rearBrake)
      ..writeByte(14)
      ..write(obj.numberOfGears)
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
      other is BicycleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BicycleModel _$BicycleModelFromJson(Map<String, dynamic> json) => BicycleModel(
      wheelSize: json['wheelSize'] as String?,
      frameSize: json['frameSize'] as String?,
      frameType: json['frameType'] as String?,
      frontBrake: json['frontBrake'] as String?,
      rearBrake: json['rearBrake'] as String?,
      numberOfGears: json['numberOfGears'] as String?,
      id: json['id'] as String?,
      brand: json['brand'] as String?,
      color: json['color'] as String?,
      price: json['price'] as String?,
      year: json['year'] as int?,
      isSold: json['isSold'] as bool? ?? false,
    )..isFavorite = json['isFavorite'] as bool?;

Map<String, dynamic> _$BicycleModelToJson(BicycleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'color': instance.color,
      'price': instance.price,
      'year': instance.year,
      'isFavorite': instance.isFavorite,
      'isSold': instance.isSold,
      'wheelSize': instance.wheelSize,
      'frameSize': instance.frameSize,
      'frameType': instance.frameType,
      'frontBrake': instance.frontBrake,
      'rearBrake': instance.rearBrake,
      'numberOfGears': instance.numberOfGears,
    };
