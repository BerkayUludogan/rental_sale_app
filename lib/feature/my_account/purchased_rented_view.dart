import 'package:flutter/material.dart';
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
late ICacheManager<BicycleModel> bicycleCacheManager;

List<VehicleModel> vehicleModelList = [];
List<BicycleModel> bicycleModelList = [];
VehicleModel vehicleModel = VehicleModel();
BicycleModel bicycleModel = BicycleModel();

class _PurchasedRentedViewState extends State<PurchasedRentedView> {
  @override
  void initState() {
    cacheManager = VehicleCacheManager(VehicleModel());
    bicycleCacheManager = BicycleCacheManager(BicycleModel());
    super.initState();
    vehicleModelList.clear();
    bicycleModelList.clear();
    fetchDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: vehicleModelList.length,
        itemBuilder: (BuildContext context, int index) {
          final model = vehicleModelList[index];

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
            ),
          );
        },
      ),
    );
  }

  Future<void> fetchDatas() async {
    await cacheManager.init();
    final vehicleModel = cacheManager.getValues();
    if (vehicleModel == null) return;
    for (final element in vehicleModel) {
      if (element.isSold == false) continue;
      setState(() {
        vehicleModelList.add(element);
      });
    }
  }

/*   Future<void> fetchDatas2() async {
    await bicycleCacheManager.init();
    final bicycleModel = bicycleCacheManager.getValues();
    if (bicycleModel == null) return;
    for (final element in bicycleModel) {
      if (element.isSold == false) continue;
      setState(() {
        bicycleModelList.add(element);
      });
    }
  } */
/*  
Scaffold(
      body: ListView.builder(
        itemCount: vehicleModelList.length,
        itemBuilder: (BuildContext context, int index) {
          final model = vehicleModelList[index];
          return Card(
            child: ListTile(
              title: Text(model.isFavorite.toString()),
              subtitle: Text(model.model!),
            ),
          );
        },
      ),
    );


 Future<void> fetchDatas() async {
    await cacheManager.init();
    final vehicleModel = cacheManager.getValues();
    if (vehicleModel == null) return;
    for (final element in vehicleModel) {
      if (element.isFavorite == false) continue;
      setState(() {
        vehicleModelList.add(element);
      });

      print(vehicleModelList);
    }
  } */
}
