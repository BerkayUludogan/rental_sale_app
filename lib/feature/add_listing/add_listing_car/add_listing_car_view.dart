import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:rental_sale_app/core/companents/custom_date_picker.dart';
import 'package:rental_sale_app/core/companents/custom_dropdown.dart';
import 'package:rental_sale_app/core/companents/custom_textfield.dart';
import 'package:rental_sale_app/core/companents/widgets/baseview.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';
import 'package:rental_sale_app/core/constants/date_constant.dart';
import 'package:rental_sale_app/core/constants/padding_constant.dart';
import 'package:rental_sale_app/core/constants/string_constant.dart';
import 'package:rental_sale_app/core/extensions/context_extension.dart';
import 'package:rental_sale_app/core/utils/textformfield_format.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/add_listing_car_viewmodel.dart';

class AddListingCarView extends StatefulWidget {
  const AddListingCarView({super.key});

  @override
  State<AddListingCarView> createState() => _AddListingCarState();
}

class _AddListingCarState extends AddListingCarViewModel {
  bool isKeyboardOpen = false;
  @override
  Widget build(BuildContext context) => _mainBody();

  Widget _mainBody() {
    isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return BaseView(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: PaddingConstant.scaffoldPadding,
            child: SizedBox(
              height: isKeyboardOpen
                  ? MediaQuery.of(context).size.height
                  : MediaQuery.of(context).size.height -
                      (kToolbarHeight + kBottomNavigationBarHeight + 20),
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
                  carPrice(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _choosedBrand() {
    return Container(
      padding: PaddingConstant.paddinAllLow,
      decoration: BoxDecoration(border: Border.all()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            StringConstant.carBrand,
            style: context.textTheme.titleMedium
                ?.copyWith(color: ColorConstant.textColor),
          ),
          CustomDropDownButton(
            choosedValue: vehicleModel.brand ?? brandList.first,
            list: brandList,
            onItemSelected: (String value) {
              setState(() {
                vehicleModel = vehicleModel.copyWith(brand: value);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget carModelText() {
    return CustomTextField(
      hintText: StringConstant.carModelEntry,
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
            StringConstant.carColor,
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

  Widget _carModelYear(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: PaddingConstant.paddinAllLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            StringConstant.carModelYear,
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

  Widget carPrice() {
    return CustomTextField(
      controller: carPriceController,
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
