import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_bicycle/model/bicycle_model.dart';
import 'package:rental_sale_app/feature/rental_sale_view/bicycle/rental_sale_bicycle_view.dart';
import 'package:rental_sale_app/product/manager/bicycle_cache_manager.dart';
import 'package:rental_sale_app/product/manager/cache_manager.dart';

abstract class RentalSaleBicycleViewModel extends State<RentalSaleBicycleView> {
  late ICacheManager<BicycleModel> cacheManager;
  List<BicycleModel> bicycleModelList = [];
  BicycleModel bicycleModel = BicycleModel();

  FToast? fToast;

  @override
  void initState() {
    super.initState();
    cacheManager = BicycleCacheManager(BicycleModel());
    fetchDatas();
    fToast = FToast();
    fToast?.init(context);
  }

  Future<void> fetchDatas() async {
    await cacheManager.init();
    final bicycleModel = cacheManager.getValues();
    if (bicycleModel == null) return;
    for (final element in bicycleModel) {
      setState(() {
        bicycleModelList.add(element);
      });
    }
  }
}
