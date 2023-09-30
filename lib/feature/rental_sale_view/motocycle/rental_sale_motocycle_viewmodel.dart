import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/vehicle_model.dart';
import 'package:rental_sale_app/feature/rental_sale_view/motocycle/rental_sale_motocycle_view.dart';
import 'package:rental_sale_app/product/manager/cache_manager.dart';
import 'package:rental_sale_app/product/manager/vehicle_cache_manager.dart';

abstract class RentalSaleMotocycleViewModel
    extends State<RentalSaleMotocycleView> {
  late ICacheManager<VehicleModel> cacheManager;

  List<VehicleModel> vehicleModelList = [];
  VehicleModel vehicleModel = VehicleModel();
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    cacheManager = VehicleCacheManager(VehicleModel());
    fetchDatas();
    fToast = FToast();
    fToast?.init(context);
  }

  Future<void> fetchDatas() async {
    await cacheManager.init();
    final vehicleModel = cacheManager.getValues();
    if (vehicleModel == null) return;
    for (final element in vehicleModel) {
      if (element.vehicleType == VehicleType.MOTOCYCLE) {
        setState(() {
          vehicleModelList.add(element);
        });
      }
    }
  }
}
