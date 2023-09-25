import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:rental_sale_app/core/companents/custom_date_picker.dart';
import 'package:rental_sale_app/core/companents/custom_dropdown.dart';
import 'package:rental_sale_app/core/companents/custom_textfield.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';
import 'package:rental_sale_app/core/constants/date_constant.dart';
import 'package:rental_sale_app/core/constants/padding_constant.dart';
import 'package:rental_sale_app/core/constants/string_constant.dart';
import 'package:rental_sale_app/core/extensions/context_extension.dart';
import 'package:rental_sale_app/core/utils/textformfield_format.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_motocycle/add_listing_motocycle_viewmodel.dart';

class AddListingMotocycleView extends StatefulWidget {
  const AddListingMotocycleView({super.key});

  @override
  State<AddListingMotocycleView> createState() =>
      _AddListingMotocycleViewState();
}

class _AddListingMotocycleViewState extends AddListingMotoCycleViewModel {
  bool isKeyboardOpen = false;

  @override
  Widget build(BuildContext context) {
    isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingConstant.scaffoldPadding,
          child: SizedBox(
            height: isKeyboardOpen
                ? MediaQuery.of(context).size.height
                : MediaQuery.of(context).size.height -
                    (kToolbarHeight + kBottomNavigationBarHeight + 100),
            child: Column(
              children: [
                const Gap(30),
                _motocycleBrand(),
                const Gap(20),
                _motocycleModel(),
                const Gap(20),
                _choosedCarColor(),
                const Gap(20),
                _motocycleModelYear(),
                const Gap(20),
                _motocyclePrice(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _motocycleBrand() {
    return Container(
      padding: PaddingConstant.paddinAllLow,
      decoration: BoxDecoration(border: Border.all()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            StringConstant.motocycleBrand,
            style: context.textTheme.titleMedium
                ?.copyWith(color: ColorConstant.textColor),
          ),
          CustomDropDownButton(
            list: brandList,
            onItemSelected: (String value) {
              setState(() {
                vehicleModel = vehicleModel.copyWith(brand: value);
              });
            },
            choosedValue: brandList.first,
          ),
        ],
      ),
    );
  }

  Widget _motocycleModel() {
    return CustomTextField(
      hintText: StringConstant.motocycleModelEntry,
      inputType: TextInputType.name,
      action: TextInputAction.next,
      onChanged: (value) {
        vehicleModel = vehicleModel.copyWith(model: value);
      },
    );
  }

  Widget _choosedCarColor() {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: PaddingConstant.paddinAllLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            StringConstant.motocycleColor,
            style: context.textTheme.titleMedium
                ?.copyWith(color: ColorConstant.textColor),
          ),
          CustomDropDownButton(
            choosedValue: vehicleModel.color ?? colorList.first,
            list: colorList,
            onItemSelected: (String value) {
              setState(() {
                vehicleModel = vehicleModel.copyWith(color: value);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _motocycleModelYear() {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: const EdgeInsets.all(2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            StringConstant.motocycleModelYear,
            style: context.textTheme.titleMedium
                ?.copyWith(color: ColorConstant.textColor),
          ),
          CustomDatePicker(
            onDateTimeChanged: (DateTime newDate) {
              setState(
                () => DateConstant.date = newDate,
              );
              vehicleModel = vehicleModel.copyWith(year: newDate.year);
            },
          ),
        ],
      ),
    );
  }

  Widget _motocyclePrice() {
    return CustomTextField(
      hintText: StringConstant.enterCarPrice,
      inputType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CurrencyInputFormatter(),
      ],
      action: TextInputAction.done,
      onChanged: (p0) {
        vehicleModel = vehicleModel.copyWith(price: p0);
      },
    );
  }
}
