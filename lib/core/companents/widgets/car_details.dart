import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rental_sale_app/core/constants/string_constant.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/vehicle_model.dart';
import 'package:rental_sale_app/feature/my_account/favorited_view.dart';
import 'package:rental_sale_app/product/manager/cache_manager.dart';
import 'package:rental_sale_app/product/manager/vehicle_cache_manager.dart';

class CarDetailsView extends StatefulWidget {
  CarDetailsView({required this.model, super.key});
  VehicleModel model;
  late ICacheManager<VehicleModel> cacheManager;
  @override
  State<CarDetailsView> createState() => _CarDetailsViewState();
}

class _CarDetailsViewState extends State<CarDetailsView> {
  @override
  void initState() {
    super.initState();
    init();
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
            const Divider(color: Colors.grey),
            const Gap(30),
            _customCarColor(),
            const Divider(color: Colors.grey),
            const Gap(30),
            _customCarModelYear(),
            const Divider(color: Colors.grey),
            const Gap(30),
            _customCarPrice(),
            const Divider(color: Colors.grey),
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

  Row _customCarPrice() {
    return _customText(
      informationText: StringConstant.carPrice,
      value: widget.model.price!.toUpperCase(),
    );
  }

  Row _customCarModelYear() {
    return _customText(
      informationText: StringConstant.carModelYear,
      value: widget.model.year.toString(),
    );
  }

  Row _customCarColor() {
    return _customText(
      informationText: StringConstant.carColor,
      value: widget.model.color!.toUpperCase(),
    );
  }

  Row _customCarModel() {
    return _customText(
      informationText: StringConstant.carModel,
      value: widget.model.model!.toUpperCase(),
    );
  }

  Container _customBrand(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width + 50,
      alignment: Alignment.center,
      child: Text(
        widget.model.brand!,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  Row _customText({required String informationText, required String value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          informationText,
          style: const TextStyle(fontSize: 22),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 22),
        ),
      ],
    );
  }
}
