// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:rental_sale_app/core/constants/hive_constant.dart';
import 'package:rental_sale_app/product/basemodel/base_brand_model.dart';
import 'package:rental_sale_app/product/database/hive_model.dart';

part 'vehicle_model.g.dart';

@HiveType(typeId: HiveConstant.vehicleTypeId)
enum VehicleType {
  @HiveField(0)
  MOTOCYCLE,
  @HiveField(1)
  CAR,
}

@HiveType(typeId: HiveConstant.vehicleId)
@JsonSerializable()
class VehicleModel extends BaseBrandModel with HiveModel<VehicleModel> {
  @HiveField(7)
  String? model;

  @HiveField(8)
  VehicleType? vehicleType;
  VehicleModel({
    this.model,
    this.vehicleType,
    super.isSold,
    super.id,
    super.brand,
    super.color,
    super.price,
    super.year,
    super.isFavorite,
  });

  VehicleModel copyWith({
    String? id,
    String? model,
    String? brand,
    String? color,
    String? price,
    int? year,
    bool? isFavorite,
    VehicleType? vehicleType,
    bool? isSold,
  }) {
    return VehicleModel(
      id: id ?? super.id,
      color: color ?? super.color,
      price: price ?? super.price,
      brand: brand ?? super.brand,
      year: year ?? super.year,
      isFavorite: isFavorite ?? super.isFavorite,
      isSold: isSold ?? super.isSold,
      model: model ?? this.model,
      vehicleType: vehicleType ?? this.vehicleType,
    );
  }

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return _$VehicleModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VehicleModelToJson(this);
  }

  @override
  String toString() {
    return 'VehicleModel(id: $id, brand: $brand, model: $model, color: $color, price: $price, year: $year, vehicleType: $vehicleType, isFavorite: $isFavorite)';
  }
}
