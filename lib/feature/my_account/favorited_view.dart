import 'package:flutter/material.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_bicycle/model/bicycle_model.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/vehicle_model.dart';
import 'package:rental_sale_app/product/manager/bicycle_cache_manager.dart';
import 'package:rental_sale_app/product/manager/cache_manager.dart';
import 'package:rental_sale_app/product/manager/vehicle_cache_manager.dart';

class FavoritedView extends StatefulWidget {
  const FavoritedView({super.key});

  @override
  State<FavoritedView> createState() => _FavoritedViewState();
}

bool isLoading = false;

class _FavoritedViewState extends State<FavoritedView> {
  late ICacheManager<VehicleModel> cacheManager;
  late ICacheManager<BicycleModel> bicycleCacheManager;

  List<VehicleModel> vehicleModelList = [];
  VehicleModel vehicleModel = VehicleModel();

  List<BicycleModel> bicycleModelList = [];
  BicycleModel bicycleModel = BicycleModel();

  List<dynamic> allList = [];

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
        itemCount: allList.length,
        itemBuilder: (BuildContext context, int index) {
          final dynamic model = allList[index];
          if (model is VehicleModel) {
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
                  onPressed: () async {
                    setState(() {
                      model.isFavorite = !model.isFavorite!;
                    });
                    await cacheManager.putItem(
                      model.id!,
                      model,
                    );
                  },
                ),
              ),
            );
          }
          if (model is BicycleModel) {
            return Card(
              child: ListTile(
                title: Text(model.brand!),
                subtitle: Text(model.frameType!.toUpperCase()),
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
                  onPressed: () async {
                    setState(() {
                      model.isFavorite = !model.isFavorite!;
                    });
                    await bicycleCacheManager.putItem(
                      model.id!,
                      model,
                    );
                  },
                ),
              ),
            );
          }
          return null;
        },
      ),
    );
  }

  Future<void> fetchDatas() async {
    try {
      await cacheManager.init();
      await bicycleCacheManager.init();
      final vehicleModel = cacheManager.getValues();
      final bicycleModel = bicycleCacheManager.getValues();
      bicycleModelList.clear();
      vehicleModelList.clear();
      if (vehicleModel == null) return;
      for (final element in vehicleModel) {
        if (element.isFavorite == false || vehicleModelList.contains(element)) {
          continue;
        }
        setState(() {
          vehicleModelList.add(element);
        });
      }
      if (bicycleModel == null) return;
      for (final element in bicycleModel) {
        if (element.isFavorite == false) continue;
        setState(() {
          bicycleModelList.add(element);
        });
      }
      setState(() {
        allList = [...vehicleModelList, ...bicycleModelList];
        allList.shuffle();
      });
    } catch (e) {
      debugPrint('hata çıktı $e');
    } finally {
      changeLoading();
      setState(() {});
    }
  }

  void changeLoading() {
    isLoading = !isLoading;
  }
}



/* import 'package:flutter/material.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_bicycle/model/bicycle_model.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/vehicle_model.dart';
import 'package:rental_sale_app/product/manager/bicycle_cache_manager.dart';
import 'package:rental_sale_app/product/manager/cache_manager.dart';
import 'package:rental_sale_app/product/manager/vehicle_cache_manager.dart';

class FavoritedView extends StatefulWidget {
  const FavoritedView({super.key});

  @override
  State<FavoritedView> createState() => _FavoritedViewState();
}

late ICacheManager<VehicleModel> cacheManager;
late ICacheManager<BicycleModel> cacheManager2;

List<VehicleModel> vehicleModelList = [];
List<BicycleModel> bicycleModelList = [];

VehicleModel vehicleModel = VehicleModel();
BicycleModel bicycleModel = BicycleModel();

List<dynamic> allItems = [];
bool isLoading = false;

class _FavoritedViewState extends State<FavoritedView> {
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
                      return _buildBicycleCard(model, index);
                    }
                    return null;
                  },
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
  }

  Card _buildBicycleCard(BicycleModel model, int index) {
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
        trailing: IconButton(
          icon: Icon(
            model.isFavorite!
                ? Icons.favorite_rounded
                : Icons.favorite_outline_rounded,
            color: model.isFavorite! ? Colors.red : Colors.black,
          ),
          onPressed: () {
            model.isFavorite = !model.isFavorite!;
          },
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

      bicycleModelList.clear();
      vehicleModelList.clear();

      for (final element in bicycleModel) {
        if (element.isFavorite == false || bicycleModelList.contains(element))
          continue;
        final newBicycleModel = BicycleModel(
          id: element.id,
          brand: element.brand,
          frameType: element.frameType,
          frameSize: element.frameSize,
          wheelSize: element.wheelSize,
          color: element.color,
          frontBrake: element.frontBrake,
          isSold: element.isSold,
          numberOfGears: element.numberOfGears,
          price: element.price,
          rearBrake: element.rearBrake,
          year: element.year,
        );
        setState(() {
          bicycleModelList.add(newBicycleModel);
        });
      }

      for (final element in vehicleModel) {
        if (element.isFavorite == false || vehicleModelList.contains(element)) {
          continue;
        }
        setState(() {
          vehicleModelList.add(element);
        });
      }
      allItems = [...vehicleModelList, ...bicycleModelList];
    } catch (e) {
      debugPrint('hata çıktı $e');
    } finally {
      setState(() {});
      changeLoading();
    }
  }
}
*/
