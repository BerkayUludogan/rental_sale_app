import 'package:flutter/material.dart';
import 'package:rental_sale_app/core/constants/date_constant.dart';
import 'package:rental_sale_app/core/enums/brand.dart';
import 'package:rental_sale_app/core/enums/colors.dart';
import 'package:rental_sale_app/core/utils/bicycle.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_bicycle/add_listing_bicycle_view.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_bicycle/model/bicycle_model.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_home/add_listing_home_viewmodel.dart';
import 'package:rental_sale_app/product/manager/bicycle_cache_manager.dart';
import 'package:rental_sale_app/product/manager/cache_manager.dart';
import 'package:uuid/uuid.dart';

abstract class AddListingBicycleViewModel extends State<AddListingBicycleView> {
  late List<String> brandList = [];
  late List<String> colorList = [];

  late ICacheManager<BicycleModel> cacheManager;
  BicycleModel bicycleModel = BicycleModel();

  @override
  void initState() {
    super.initState();

    brandList = List.generate(
      BicycleBrand.values.length,
      (index) => BicycleBrand.values[index].name,
    );

    colorList = List.generate(
      EnumColor.values.length,
      (index) => EnumColor.values[index].name,
    );
    bicycleModel = bicycleModel.copyWith(
      brand: brandList.first,
      frameSize: BicycleProperty.frameSize.first,
      frameType: BicycleProperty.frameType.first,
      rearBrake: BicycleProperty.brakeType.first,
      frontBrake: BicycleProperty.brakeType.first,
      numberOfGears: BicycleProperty.numberOfGears.first,
      wheelSize: BicycleProperty.wheelSizeList.first,
      year: DateConstant.date.year,
      color: colorList.first,
    );

    cacheManager = BicycleCacheManager(BicycleModel());

    AddListingViewModel.instance.whenComplate = saveDataToHive;
    init();
  }

  Future<void> init() async {
    cacheManager = BicycleCacheManager(BicycleModel());
    await cacheManager.init();
  }

  Future<void> saveDataToHive() async {
    final uuid = const Uuid().v4();
    bicycleModel = bicycleModel.copyWith(id: uuid);
    if (bicycleModel.id == null ||
        bicycleModel.brand == null ||
        bicycleModel.color == null ||
        bicycleModel.frameSize == null ||
        bicycleModel.frameType == null ||
        bicycleModel.frontBrake == null ||
        bicycleModel.year == null ||
        bicycleModel.numberOfGears == null ||
        bicycleModel.price == null ||
        bicycleModel.rearBrake == null ||
        bicycleModel.wheelSize == null) return;
    await cacheManager.putItem(
      uuid,
      bicycleModel,
    );
    print('Kayit başarılı');
  }
}
