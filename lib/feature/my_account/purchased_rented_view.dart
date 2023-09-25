import 'package:flutter/material.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/vehicle_model.dart';
import 'package:rental_sale_app/product/manager/cache_manager.dart';
import 'package:rental_sale_app/product/manager/vehicle_cache_manager.dart';

class PurchasedRentedView extends StatefulWidget {
  const PurchasedRentedView({super.key});

  @override
  State<PurchasedRentedView> createState() => _PurchasedRentedViewState();
}

late ICacheManager<VehicleModel> cacheManager;

List<VehicleModel> vehicleModelList = [];
VehicleModel vehicleModel = VehicleModel();

class _PurchasedRentedViewState extends State<PurchasedRentedView> {
  @override
  void initState() {
    cacheManager = VehicleCacheManager(VehicleModel());
    super.initState();
    vehicleModelList.clear();
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
              title: Text(model.brand!),
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
