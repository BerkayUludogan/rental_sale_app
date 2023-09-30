import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:rental_sale_app/core/companents/custom_bicycle_dropdown.dart';
import 'package:rental_sale_app/core/companents/custom_choosedcolor_field.dart';
import 'package:rental_sale_app/core/companents/custom_date_picker.dart';
import 'package:rental_sale_app/core/companents/custom_textfield.dart';
import 'package:rental_sale_app/core/companents/widgets/baseview.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';
import 'package:rental_sale_app/core/constants/date_constant.dart';
import 'package:rental_sale_app/core/constants/padding_constant.dart';
import 'package:rental_sale_app/core/constants/string_constant.dart';
import 'package:rental_sale_app/core/extensions/context_extension.dart';
import 'package:rental_sale_app/core/utils/bicycle.dart';
import 'package:rental_sale_app/core/utils/textformfield_format.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_bicycle/add_listing_bicycle_viewmodel.dart';

class AddListingBicycleView extends StatefulWidget {
  const AddListingBicycleView({super.key});

  @override
  State<AddListingBicycleView> createState() => _AddListingBicycleViewState();
}

class _AddListingBicycleViewState extends AddListingBicycleViewModel {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: PaddingConstant.scaffoldPadding,
            child: Column(
              children: [
                const Gap(30),
                _bicycleBrand(),
                const Gap(20),
                _bicycleColor(),
                const Gap(20),
                _bicycleWheelSize(),
                const Gap(20),
                _bicycleFrameType(),
                const Gap(20),
                _bicycleFrameSize(),
                const Gap(20),
                _bicycleRearBrake(),
                const Gap(20),
                _bicycleFrontBrake(),
                const Gap(20),
                _bicycleNumberOfGears(),
                const Gap(20),
                _bicycleModelYear(context),
                const Gap(20),
                _bicyclePrice(),
                const Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bicycleBrand() {
    return CustomBicycleDropDown(
      text: StringConstant.bicycleBrand,
      onItemSelected: (String value) {
        setState(() {
          bicycleModel = bicycleModel.copyWith(brand: value);
        });
      },
      choosedValue: bicycleModel.brand ?? brandList.first,
      list: brandList,
    );
  }

  Widget _bicycleColor() {
    return CustomChoosedColor(
      choosedValue: bicycleModel.color ?? colorList.first,
      onItemSelected: (String value) {
        setState(() {
          bicycleModel = bicycleModel.copyWith(color: value);
        });
      },
      text: StringConstant.bicycleColor,
    );
  }

  Widget _bicycleWheelSize() {
    return CustomBicycleDropDown(
      text: StringConstant.bicycleWheelSize,
      onItemSelected: (String value) {
        setState(
          () {
            bicycleModel = bicycleModel.copyWith(wheelSize: value);
          },
        );
      },
      choosedValue:
          bicycleModel.wheelSize ?? BicycleProperty.wheelSizeList.first,
      list: BicycleProperty.wheelSizeList,
    );
  }

  Widget _bicycleFrameType() {
    return CustomBicycleDropDown(
      text: StringConstant.bicycleFrameType,
      onItemSelected: (String value) {
        setState(() {
          bicycleModel = bicycleModel.copyWith(frameType: value);
        });
      },
      choosedValue: bicycleModel.frameType ?? BicycleProperty.frameType.first,
      list: BicycleProperty.frameType,
    );
  }

  Widget _bicycleFrameSize() {
    return CustomBicycleDropDown(
      text: StringConstant.bicycleFrameSize,
      onItemSelected: (String value) {
        setState(() {
          bicycleModel = bicycleModel.copyWith(frameSize: value);
        });
      },
      choosedValue: bicycleModel.frameSize ?? BicycleProperty.frameSize.first,
      list: BicycleProperty.frameSize,
    );
  }

  Widget _bicycleFrontBrake() {
    return CustomBicycleDropDown(
      text: StringConstant.bicycleFrontBrake,
      onItemSelected: (String value) {
        setState(() {
          bicycleModel = bicycleModel.copyWith(frontBrake: value);
        });
      },
      choosedValue: bicycleModel.frontBrake ?? BicycleProperty.brakeType.first,
      list: BicycleProperty.brakeType,
    );
  }

  Widget _bicycleRearBrake() {
    return CustomBicycleDropDown(
      text: StringConstant.bicycleRearBrake,
      onItemSelected: (String value) {
        setState(() {
          bicycleModel = bicycleModel.copyWith(rearBrake: value);
        });
      },
      choosedValue: bicycleModel.rearBrake ?? BicycleProperty.brakeType.first,
      list: BicycleProperty.brakeType,
    );
  }

  Widget _bicycleNumberOfGears() {
    return CustomBicycleDropDown(
      text: StringConstant.bicycleNumberOfGears,
      onItemSelected: (String value) {
        setState(() {
          bicycleModel = bicycleModel.copyWith(numberOfGears: value);
        });
      },
      choosedValue:
          bicycleModel.numberOfGears ?? BicycleProperty.numberOfGears.first,
      list: BicycleProperty.numberOfGears,
    );
  }

  Widget _bicycleModelYear(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: PaddingConstant.paddinAllLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            StringConstant.bicycleModelYear,
            style: context.textTheme.titleMedium
                ?.copyWith(color: ColorConstant.textColor),
          ),
          CustomDatePicker(
            onDateTimeChanged: (DateTime newDate) {
              setState(
                () => DateConstant.date = newDate,
              );
              bicycleModel = bicycleModel.copyWith(year: newDate.year);
            },
          ),
        ],
      ),
    );
  }

  Widget _bicyclePrice() {
    return CustomTextField(
      hintText: StringConstant.enterBicyclePrice,
      inputType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CurrencyInputFormatter(),
      ],
      action: TextInputAction.done,
      onChanged: (p0) {
        bicycleModel = bicycleModel.copyWith(price: p0);
      },
    );
  }
}
