import 'package:hive/hive.dart';
import 'package:rental_sale_app/core/constants/hive_constant.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_bicycle/model/bicycle_model.dart';
import 'package:rental_sale_app/product/manager/cache_manager.dart';

class BicycleCacheManager extends ICacheManager<BicycleModel> {
  BicycleCacheManager(super.model);

  @override
  BicycleModel? getItem(String id) => box?.get(id);

  @override
  List<BicycleModel>? getValues() => box?.values.toList();

  @override
  Future<void> putItem(String key, BicycleModel model) async =>
      box?.put(key, model);

  @override
  Future<void> registerAdapters() async {
    if (!Hive.isAdapterRegistered(HiveConstant.bicycleTypeId)) {
      Hive.registerAdapter(BicycleModelAdapter());
    }
  }

  @override
  Future<void> removeItem(String item) async => await box?.delete(item);
}
