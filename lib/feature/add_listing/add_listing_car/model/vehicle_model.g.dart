// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VehicleModelAdapter extends TypeAdapter<VehicleModel> {
  @override
  final int typeId = 51;

  @override
  VehicleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VehicleModel(
      model: fields[7] as String?,
      vehicleType: fields[8] as VehicleType?,
      isSold: fields[6] as bool,
      id: fields[0] as String?,
      brand: fields[1] as String?,
      color: fields[2] as String?,
      price: fields[3] as String?,
      year: fields[4] as int?,
      isFavorite: fields[5] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, VehicleModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(7)
      ..write(obj.model)
      ..writeByte(8)
      ..write(obj.vehicleType)
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
      other is VehicleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VehicleTypeAdapter extends TypeAdapter<VehicleType> {
  @override
  final int typeId = 61;

  @override
  VehicleType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return VehicleType.MOTOCYCLE;
      case 1:
        return VehicleType.CAR;
      default:
        return VehicleType.MOTOCYCLE;
    }
  }

  @override
  void write(BinaryWriter writer, VehicleType obj) {
    switch (obj) {
      case VehicleType.MOTOCYCLE:
        writer.writeByte(0);
      case VehicleType.CAR:
        writer.writeByte(1);
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VehicleTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) => VehicleModel(
      model: json['model'] as String?,
      vehicleType:
          $enumDecodeNullable(_$VehicleTypeEnumMap, json['vehicleType']),
      isSold: json['isSold'] as bool? ?? false,
      id: json['id'] as String?,
      brand: json['brand'] as String?,
      color: json['color'] as String?,
      price: json['price'] as String?,
      year: json['year'] as int?,
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'color': instance.color,
      'price': instance.price,
      'year': instance.year,
      'isFavorite': instance.isFavorite,
      'isSold': instance.isSold,
      'model': instance.model,
      'vehicleType': _$VehicleTypeEnumMap[instance.vehicleType],
    };

const _$VehicleTypeEnumMap = {
  VehicleType.MOTOCYCLE: 'MOTOCYCLE',
  VehicleType.CAR: 'CAR',
};
