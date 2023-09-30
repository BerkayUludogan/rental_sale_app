import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:rental_sale_app/core/companents/custom_toastMessage.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';
import 'package:rental_sale_app/core/constants/string_constant.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_bicycle/model/bicycle_model.dart';
import 'package:rental_sale_app/product/manager/bicycle_cache_manager.dart';
import 'package:rental_sale_app/product/manager/cache_manager.dart';

// ignore: must_be_immutable
class BicycleDetailsView extends StatefulWidget {
  BicycleDetailsView({required this.model, super.key});

  BicycleModel model;

  @override
  State<BicycleDetailsView> createState() => _BicycleDetailsViewState();
}

late ICacheManager<BicycleModel> cacheManager;

class _BicycleDetailsViewState extends State<BicycleDetailsView> {
  FToast? fToast;

  @override
  void initState() {
    super.initState();
    init();
    fToast = FToast();
    fToast?.init(context);
  }

  Future<void> init() async {
    cacheManager = BicycleCacheManager(BicycleModel());
    await cacheManager.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _customBicycleBrand(context),
              Divider(color: ColorConstant.dividerColor),
              const Gap(20),
              _customBicycleColor(),
              Divider(color: ColorConstant.dividerColor),
              const Gap(20),
              _customBicycleWheelSize(),
              Divider(color: ColorConstant.dividerColor),
              const Gap(20),
              _customBicycleFrameType(),
              Divider(color: ColorConstant.dividerColor),
              const Gap(20),
              _customBicycleFrameSize(),
              Divider(color: ColorConstant.dividerColor),
              const Gap(20),
              _customBicycleFrontBrake(),
              Divider(color: ColorConstant.dividerColor),
              const Gap(20),
              _customBicycleRearBrake(),
              Divider(color: ColorConstant.dividerColor),
              const Gap(20),
              _customBicycleNumberOfGears(),
              Divider(color: ColorConstant.dividerColor),
              const Gap(20),
              _customBicycleYear(),
              Divider(color: ColorConstant.dividerColor),
              const Gap(20),
              _customBicyclePrice(),
              Divider(color: ColorConstant.dividerColor),
              const Gap(20),
              _customPurchasedButton(context),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }

  Center _customPurchasedButton(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 40,
        width: 130,
        child: ElevatedButton(
          onPressed: () async {
            widget.model = widget.model.copyWith(isSold: true);
            await cacheManager.putItem(
              widget.model.id!,
              widget.model,
            );
            fToast?.showToast(
              child: const CustomToastMessage(
                  text: StringConstant.bicyclePurchased),
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
      ),
    );
  }

  Widget _customText({required String informationText, required String value}) {
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

  Container _customBicycleBrand(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(
        widget.model.brand!.toUpperCase(),
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _customBicycleColor() {
    return _customText(
      informationText: StringConstant.bicycleColor,
      value: widget.model.color!.toUpperCase(),
    );
  }

  Widget _customBicycleWheelSize() {
    return _customText(
      informationText: StringConstant.bicycleWheelSize,
      value: widget.model.wheelSize!,
    );
  }

  Widget _customBicycleFrameType() {
    return _customText(
      informationText: StringConstant.bicycleFrameType,
      value: widget.model.frameType!,
    );
  }

  Widget _customBicycleFrameSize() {
    return _customText(
      informationText: StringConstant.bicycleFrameSize,
      value: widget.model.frameSize!,
    );
  }

  Widget _customBicycleFrontBrake() {
    return _customText(
        informationText: StringConstant.bicycleFrontBrake,
        value: widget.model.frontBrake!);
  }

  Widget _customBicycleRearBrake() {
    return _customText(
        informationText: StringConstant.bicycleRearBrake,
        value: widget.model.rearBrake!);
  }

  Widget _customBicycleNumberOfGears() {
    return _customText(
      informationText: StringConstant.bicycleNumberOfGears,
      value: widget.model.numberOfGears!,
    );
  }

  Widget _customBicycleYear() {
    return _customText(
      informationText: StringConstant.carModelYear,
      value: widget.model.year.toString(),
    );
  }

  Widget _customBicyclePrice() {
    return _customText(
      informationText: StringConstant.bicyclePrice,
      value: widget.model.price!.toUpperCase(),
    );
  }
}
