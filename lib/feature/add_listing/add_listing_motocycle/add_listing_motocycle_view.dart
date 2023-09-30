import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:rental_sale_app/core/companents/custom_choosedbrand.dart';
import 'package:rental_sale_app/core/companents/custom_choosedcolor_field.dart';
import 'package:rental_sale_app/core/companents/custom_model_text.dart';
import 'package:rental_sale_app/core/companents/custom_modelyear_field.dart';
import 'package:rental_sale_app/core/companents/custom_price_text_field.dart';
import 'package:rental_sale_app/core/companents/custom_textfield.dart';
import 'package:rental_sale_app/core/constants/date_constant.dart';
import 'package:rental_sale_app/core/constants/padding_constant.dart';
import 'package:rental_sale_app/core/constants/string_constant.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_motocycle/add_listing_motocycle_viewmodel.dart';

class AddListingMotocycleView extends StatefulWidget {
  const AddListingMotocycleView({super.key});

  @override
  State<AddListingMotocycleView> createState() =>
      _AddListingMotocycleViewState();
}

class _AddListingMotocycleViewState extends AddListingMotoCycleViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingConstant.scaffoldPadding,
          child: SizedBox(
            child: Column(
              children: [
                const Gap(30),
                _motocycleBrand(),
                const Gap(20),
                _motocycleModel(),
                const Gap(20),
                _motocycleChoosedColor(),
                const Gap(20),
                _motocycleModelYear(),
                const Gap(20),
                _motocyclePrice(),
                const Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _motocycleBrand() {
    return CustomChoosedBrand(
      choosedValue: vehicleModel.brand ?? brandList.first,
      list: brandList,
      onItemSelected: (String value) {
        setState(() {
          vehicleModel = vehicleModel.copyWith(brand: value);
        });
      },
      text: StringConstant.motocycleBrand,
    );
  }

  Widget _motocycleModel() {
    return CustomModelText(
      hintText: StringConstant.motocycleModelEntry,
      onChanged: (value) {
        vehicleModel = vehicleModel.copyWith(model: value);
      },
    );
  }

  Widget _motocycleChoosedColor() {
    return CustomChoosedColor(
      choosedValue: vehicleModel.color ?? colorList.first,
      onItemSelected: (String value) {
        setState(() {
          vehicleModel = vehicleModel.copyWith(color: value);
        });
      },
      text: StringConstant.motocycleColor,
    );
  }

  Widget _motocycleModelYear() {
    return CustomModelYearField(
      onDateTimeChanged: (DateTime newDate) {
        setState(
          () => DateConstant.date = newDate,
        );
        vehicleModel = vehicleModel.copyWith(year: newDate.year);
      },
      text: StringConstant.motocycleModelYear,
    );
  }

  Widget _motocyclePrice() {
    return CustomPriceTextField(
      onChanged: (p0) {
        vehicleModel = vehicleModel.copyWith(price: p0);
      },
      hintText: StringConstant.enterMotocyclePrice,
    );
  }
}
