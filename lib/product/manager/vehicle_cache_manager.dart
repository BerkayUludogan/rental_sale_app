import 'package:hive_flutter/adapters.dart';
import 'package:rental_sale_app/core/constants/hive_constant.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/vehicle_model.dart';
import 'package:rental_sale_app/product/basemodel/base_brand_model.dart';
import 'package:rental_sale_app/product/manager/cache_manager.dart';

class VehicleCacheManager extends ICacheManager<VehicleModel> {
  VehicleCacheManager(super.model);

  @override
  VehicleModel? getItem(String id) => box?.get(id);

  @override
  List<VehicleModel>? getValues() => box?.values.toList();

  @override
  Future<void> putItem(String key, VehicleModel model) async =>
      box?.put(key, model);

  @override
  Future<void> registerAdapters() async {
    if (!Hive.isAdapterRegistered(HiveConstant.vehicleId)) {
      Hive.registerAdapter(VehicleModelAdapter());
    }
    if (!Hive.isAdapterRegistered(HiveConstant.vehicleTypeId)) {
      Hive.registerAdapter(VehicleTypeAdapter());
    }
    if (!Hive.isAdapterRegistered(HiveConstant.vehicleBaseId)) {
      Hive.registerAdapter(BaseBrandModelAdapter());
    }
  }

  @override
  Future<void> removeItem(String item) async => await box?.delete(item);
}
