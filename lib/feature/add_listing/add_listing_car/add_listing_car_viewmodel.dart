import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:rental_sale_app/core/constants/date_constant.dart';
import 'package:rental_sale_app/core/enums/brand.dart';
import 'package:rental_sale_app/core/enums/colors.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/add_listing_car_view.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/vehicle_model.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_home/add_listing_home_viewmodel.dart';
import 'package:rental_sale_app/product/manager/cache_manager.dart';
import 'package:rental_sale_app/product/manager/vehicle_cache_manager.dart';
import 'package:uuid/uuid.dart';

abstract class AddListingCarViewModel extends State<AddListingCarView> {
  late List<String> brandList = [];
  late List<String> colorList = [];

  late ICacheManager<VehicleModel> cacheManager;
  VehicleModel vehicleModel = VehicleModel();

  final carBrandController = TextEditingController();
  final carModelController = TextEditingController();
  final carColorController = TextEditingController();
  final carModelYearController = TextEditingController();
  final carPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();

    brandList = List.generate(
      CarBrand.values.length,
      (index) => CarBrand.values[index].name,
    );
    colorList = List.generate(
      EnumColor.values.length,
      (index) => EnumColor.values[index].name,
    );

    vehicleModel = vehicleModel.copyWith(
      brand: brandList.first,
      color: colorList.first,
      year: DateConstant.date.year,
    );
    init();
    AddListingViewModel.instance.whenComplate = saveDataToHive;
  }

  Future<void> init() async {
    cacheManager = VehicleCacheManager(VehicleModel());
    //   await Hive.deleteBoxFromDisk(VehicleModel().modelKey);
    await cacheManager.init();
    fetchDatas();
  }

  Future<void> fetchDatas() async {
    //await cacheManager.clearAll();

    /*   final bicycleModel = cacheManager.getValues();
    if (bicycleModel == null) return;
    print(bicycleModel.first);
    bicycleModel.first = bicycleModel.first.copyWith(isFavorite: true);
    await cacheManager.putItem(bicycleModel.first.id!, bicycleModel.first); */
  }

  @override
  void dispose() {
    super.dispose();

    carBrandController.dispose();
    carModelController.dispose();
    carColorController.dispose();
    carModelYearController.dispose();
    carPriceController.dispose();
  }

  Future<void> saveDataToHive() async {
    vehicleModel = vehicleModel.copyWith(vehicleType: VehicleType.CAR);

    final uuid = const Uuid().v4();
    vehicleModel = vehicleModel.copyWith(id: uuid);
    if (vehicleModel.id == null ||
        vehicleModel.brand == null ||
        vehicleModel.model == null ||
        vehicleModel.price == null ||
        vehicleModel.year == null ||
        vehicleModel.color == null) return;
    try {
      await cacheManager.putItem(
        uuid,
        vehicleModel,
      );
    } catch (error) {
      print(error);
    }

    print("Kayıt başarılı");
  }
}
