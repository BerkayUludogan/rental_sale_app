import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rental_sale_app/core/companents/custom_choosedbrand.dart';
import 'package:rental_sale_app/core/companents/custom_choosedcolor_field.dart';
import 'package:rental_sale_app/core/companents/custom_model_text.dart';
import 'package:rental_sale_app/core/companents/custom_modelyear_field.dart';
import 'package:rental_sale_app/core/companents/custom_price_text_field.dart';
import 'package:rental_sale_app/core/companents/widgets/baseview.dart';
import 'package:rental_sale_app/core/constants/date_constant.dart';
import 'package:rental_sale_app/core/constants/padding_constant.dart';
import 'package:rental_sale_app/core/constants/string_constant.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/add_listing_car_viewmodel.dart';

class AddListingCarView extends StatefulWidget {
  const AddListingCarView({super.key});

  @override
  State<AddListingCarView> createState() => _AddListingCarState();
}

class _AddListingCarState extends AddListingCarViewModel {
  @override
  Widget build(BuildContext context) => _mainBody();

  Widget _mainBody() {
    return BaseView(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: PaddingConstant.scaffoldPadding,
            child: SizedBox(
              child: Column(
                children: [
                  const Gap(30),
                  _choosedBrand(),
                  const Gap(20),
                  carModelText(),
                  const Gap(20),
                  _choosedCarColor(),
                  const Gap(20),
                  _carModelYear(context),
                  const Gap(20),
                  _carPrice(),
                  const Gap(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _choosedBrand() {
    return CustomChoosedBrand(
      choosedValue: vehicleModel.brand ?? brandList.first,
      list: brandList,
      onItemSelected: (String value) {
        setState(() {
          vehicleModel = vehicleModel.copyWith(brand: value);
        });
      },
      text: StringConstant.carBrand,
    );
  }

  Widget carModelText() {
    return CustomModelText(
      hintText: StringConstant.carModelEntry,
      onChanged: (value) {
        vehicleModel = vehicleModel.copyWith(model: value);
      },
    );
  }

  Widget _choosedCarColor() {
    return CustomChoosedColor(
      choosedValue: vehicleModel.color ?? colorList.first,
      onItemSelected: (String value) {
        setState(() {
          vehicleModel = vehicleModel.copyWith(color: value);
        });
      },
      text: StringConstant.carColor,
    );
  }

  Widget _carModelYear(BuildContext context) {
    return CustomModelYearField(
      onDateTimeChanged: (DateTime newDate) {
        setState(
          () => DateConstant.date = newDate,
        );
        vehicleModel = vehicleModel.copyWith(year: newDate.year);
      },
      text: StringConstant.carModelYear,
    );
  }

  Widget _carPrice() {
    return CustomPriceTextField(
      onChanged: (p0) {
        vehicleModel = vehicleModel.copyWith(price: p0);
      },
      hintText: StringConstant.enterCarPrice,
    );
  }
}
