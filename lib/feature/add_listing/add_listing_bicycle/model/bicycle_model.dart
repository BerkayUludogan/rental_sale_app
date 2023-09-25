import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rental_sale_app/core/constants/hive_constant.dart';
import 'package:rental_sale_app/product/basemodel/base_brand_model.dart';
import 'package:rental_sale_app/product/database/hive_model.dart';

part 'bicycle_model.g.dart';

@HiveType(typeId: HiveConstant.bicycleTypeId)
@JsonSerializable()
class BicycleModel extends BaseBrandModel with HiveModel<BicycleModel> {
  BicycleModel({
    this.wheelSize,
    this.frameSize,
    this.frameType,
    this.frontBrake,
    this.rearBrake,
    this.numberOfGears,
    super.id,
    super.brand,
    super.color,
    super.price,
    super.year,
    super.isSold,
  });

  factory BicycleModel.fromJson(Map<String, dynamic> json) {
    return _$BicycleModelFromJson(json);
  }
  @HiveField(9)
  String? wheelSize;
  @HiveField(10)
  String? frameSize;
  @HiveField(11)
  String? frameType;
  @HiveField(12)
  String? frontBrake;
  @HiveField(13)
  String? rearBrake;
  @HiveField(14)
  String? numberOfGears;

  BicycleModel copyWith({
    String? id,
    String? brand,
    String? color,
    String? wheelSize,
    String? frameSize,
    String? frameType,
    String? frontBrake,
    String? rearBrake,
    String? numberOfGears,
    int? year,
    String? price,
    bool? isSold,
  }) {
    return BicycleModel(
      id: id ?? super.id,
      brand: brand ?? super.brand,
      color: color ?? super.color,
      isSold: isSold ?? super.isSold,
      wheelSize: wheelSize ?? this.wheelSize,
      frameSize: frameSize ?? this.frameSize,
      frameType: frameType ?? this.frameType,
      frontBrake: frontBrake ?? this.frontBrake,
      rearBrake: rearBrake ?? this.rearBrake,
      numberOfGears: numberOfGears ?? this.numberOfGears,
      year: year ?? this.year,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toJson() => _$BicycleModelToJson(this);
  @override
  String toString() {
    return 'bicycleModel(id: $id, brand: $brand, color: $color, wheelSize: $wheelSize, frameSize: $frameSize, frameType: $frameType, price: $price)';
  }
}
