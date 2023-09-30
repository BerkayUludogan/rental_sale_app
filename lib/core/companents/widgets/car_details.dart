import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:rental_sale_app/core/companents/custom_toastMessage.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';
import 'package:rental_sale_app/core/constants/string_constant.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/vehicle_model.dart';
import 'package:rental_sale_app/feature/my_account/favorited_view.dart';
import 'package:rental_sale_app/product/manager/cache_manager.dart';
import 'package:rental_sale_app/product/manager/vehicle_cache_manager.dart';

// ignore: must_be_immutable
class CarDetailsView extends StatefulWidget {
  CarDetailsView({required this.model, super.key});
  VehicleModel model;
  late ICacheManager<VehicleModel> cacheManager;
  @override
  State<CarDetailsView> createState() => _CarDetailsViewState();
}

class _CarDetailsViewState extends State<CarDetailsView> {
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    init();
    fToast = FToast();
    fToast?.init(context);
  }

  Future<void> init() async {
    cacheManager = VehicleCacheManager(VehicleModel());
    await cacheManager.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _customBrand(context),
            _customCarModel(),
            Divider(color: ColorConstant.dividerColor),
            const Gap(30),
            _customCarColor(),
            Divider(color: ColorConstant.dividerColor),
            const Gap(30),
            _customCarModelYear(),
            Divider(color: ColorConstant.dividerColor),
            const Gap(30),
            _customCarPrice(),
            Divider(color: ColorConstant.dividerColor),
            const Gap(40),
            _customPurchasedButton(context),
          ],
        ),
      ),
    );
  }

  Center _customPurchasedButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          widget.model = widget.model.copyWith(isSold: true);
          await cacheManager.putItem(
            widget.model.id!,
            widget.model,
          );
          fToast?.showToast(
            child: const CustomToastMessage(text: StringConstant.carPurchased),
            toastDuration: const Duration(seconds: 1),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue.shade200,
        ),
        child: Text(
          StringConstant.purchased,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(),
        ),
      ),
    );
  }

  Widget _customCarPrice() {
    return _customText(
      informationText: StringConstant.carPrice,
      value: widget.model.price!.toUpperCase(),
    );
  }

  Widget _customCarModelYear() {
    return _customText(
      informationText: StringConstant.carYear,
      value: widget.model.year.toString(),
    );
  }

  Widget _customCarColor() {
    return _customText(
      informationText: StringConstant.carColor,
      value: widget.model.color!.toUpperCase(),
    );
  }

  Widget _customCarModel() {
    return _customText(
      informationText: StringConstant.carModel,
      value: widget.model.model!.toUpperCase(),
    );
  }

  Container _customBrand(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(
        widget.model.brand!,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Row _customText({required String informationText, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          informationText,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
