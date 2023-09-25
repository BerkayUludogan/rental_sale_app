import 'package:hive_flutter/adapters.dart';
import 'package:rental_sale_app/core/constants/hive_constant.dart';

part 'base_brand_model.g.dart';

@HiveType(typeId: HiveConstant.vehicleBaseId)
class BaseBrandModel {
  BaseBrandModel({
    this.id,
    this.brand,
    this.color,
    this.price,
    this.year,
    this.isFavorite = false,
    this.isSold = false,
  });
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? brand;
  @HiveField(2)
  String? color;
  @HiveField(3)
  String? price;
  @HiveField(4)
  int? year;
  @HiveField(5)
  bool? isFavorite;
  @HiveField(6)
  bool isSold;
}
