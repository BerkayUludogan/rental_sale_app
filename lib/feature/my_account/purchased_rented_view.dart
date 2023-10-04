import 'package:flutter/material.dart';
import 'package:rental_sale_app/core/constants/string_constant.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_bicycle/model/bicycle_model.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/vehicle_model.dart';
import 'package:rental_sale_app/product/manager/bicycle_cache_manager.dart';
import 'package:rental_sale_app/product/manager/cache_manager.dart';
import 'package:rental_sale_app/product/manager/vehicle_cache_manager.dart';

class PurchasedRentedView extends StatefulWidget {
  const PurchasedRentedView({super.key});

  @override
  State<PurchasedRentedView> createState() => _PurchasedRentedViewState();
}

late ICacheManager<VehicleModel> cacheManager;
late ICacheManager<BicycleModel> cacheManager2;
List<VehicleModel> vehicleModelList = [];
List<BicycleModel> bicycleModelList = [];
VehicleModel vehicleModel = VehicleModel();
BicycleModel bicycleModel = BicycleModel();
List<dynamic> allItems = [];
bool isLoading = false;

class _PurchasedRentedViewState extends State<PurchasedRentedView> {
  @override
  void initState() {
    cacheManager = VehicleCacheManager(VehicleModel());
    cacheManager2 = BicycleCacheManager(BicycleModel());
    super.initState();
    vehicleModelList.clear();
    bicycleModelList.clear();
    fetchDatas();
  }

  void changeLoading() {
    isLoading = !isLoading;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : allItems.isEmpty
              ? const Center(
                  child: Text(
                    'Favoriye Alınmış Araç Bulunamadı.',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  itemCount: allItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    allItems.shuffle();

                    final dynamic model = allItems[index];

                    if (model is VehicleModel) {
                      return _buildVehicleCard(model);
                    }
                    if (model is BicycleModel) {
                      return _buildBicycleCard(model);
                    }
                    return null;
                  },
                ),
    );
  }

  Card _buildBicycleCard(BicycleModel model) {
    return Card(
      child: ListTile(
        title: Text(model.brand!.toUpperCase()),
        subtitle: Text(model.frameType!.toUpperCase()),
        leading: Text(
          model.year.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        trailing: const Text(
          StringConstant.purchased,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Card _buildVehicleCard(VehicleModel model) {
    return Card(
      child: ListTile(
        title: Text(model.brand!.toUpperCase()),
        subtitle: Text(model.model!.toUpperCase()),
        leading: Text(
          model.year.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        trailing: const Text(
          StringConstant.purchased,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Future<void> fetchDatas() async {
    try {
      changeLoading();
      await cacheManager.init();
      await cacheManager2.init();
      final vehicleModel = cacheManager.getValues();
      final bicycleModel = cacheManager2.getValues();

      if (bicycleModel == null || vehicleModel == null) return;

      for (final element in bicycleModel) {
        if (element.isSold == false || bicycleModelList.contains(element)) {
          continue;
        }
        setState(() {
          bicycleModelList.add(element);
        });
      }

      for (final element in vehicleModel) {
        if (element.isSold == false || vehicleModelList.contains(element)) {
          continue;
        }
        setState(() {
          vehicleModelList.add(element);
        });
      }

      allItems = [...vehicleModelList, ...bicycleModelList];
    } catch (error) {
      debugPrint('Hata oluştu: $error');
    } finally {
      changeLoading();
      setState(() {});
    }
  }
}
