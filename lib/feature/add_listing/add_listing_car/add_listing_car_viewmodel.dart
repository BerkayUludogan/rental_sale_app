import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  FToast? fToast;

  final carBrandController = TextEditingController();
  final carModelController = TextEditingController();
  final carColorController = TextEditingController();
  final carModelYearController = TextEditingController();
  final carPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();

    fToast = FToast();
    fToast?.init(context);

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
    // await Hive.deleteBoxFromDisk(VehicleModel().modelKey);
    await cacheManager.init();
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

      showCustomToast();
    } catch (error) {
      print(error);
    }
  }

  void showCustomToast() {
    final Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.blueGrey,
      ),
      child: const Text(
        'Araç İlana Eklendi ',
        style: TextStyle(color: Colors.white),
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 1),
    );
  }
}
