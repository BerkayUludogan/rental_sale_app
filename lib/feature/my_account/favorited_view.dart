import 'package:flutter/material.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/vehicle_model.dart';
import 'package:rental_sale_app/product/manager/cache_manager.dart';
import 'package:rental_sale_app/product/manager/vehicle_cache_manager.dart';

class FavoritedView extends StatefulWidget {
  const FavoritedView({super.key});

  @override
  State<FavoritedView> createState() => _FavoritedViewState();
}

late ICacheManager<VehicleModel> cacheManager;

List<VehicleModel> vehicleModelList = [];
VehicleModel vehicleModel = VehicleModel();

class _FavoritedViewState extends State<FavoritedView> {
  @override
  void initState() {
    cacheManager = VehicleCacheManager(VehicleModel());
    super.initState();
    vehicleModelList.clear();
    print(cacheManager);
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
              trailing: IconButton(
                icon: Icon(
                  model.isFavorite!
                      ? Icons.favorite_rounded
                      : Icons.favorite_outline_rounded,
                  color: model.isFavorite! ? Colors.red : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    model.isFavorite = !model.isFavorite!;
                  });
                },
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
      if (element.isFavorite == false) continue;
      setState(() {
        vehicleModelList.add(element);
      });
    }
  }
}
