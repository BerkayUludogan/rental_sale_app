import 'package:flutter/material.dart';
import 'package:rental_sale_app/core/companents/custom_dropdown.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';
import 'package:rental_sale_app/core/constants/padding_constant.dart';
import 'package:rental_sale_app/core/enums/colors.dart';
import 'package:rental_sale_app/core/extensions/context_extension.dart';

// ignore: must_be_immutable
class CustomChoosedColor extends StatelessWidget {
  CustomChoosedColor({
    required this.choosedValue,
    required this.onItemSelected,
    required this.text,
    super.key,
  });
  final String text;
  final String choosedValue;
  final void Function(String) onItemSelected;
  late List<String> colorList = [];

  @override
  Widget build(BuildContext context) {
    colorList = List.generate(
      EnumColor.values.length,
      (index) => EnumColor.values[index].name,
    );
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      padding: PaddingConstant.paddinAllLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: context.textTheme.titleMedium
                ?.copyWith(color: ColorConstant.textColor),
          ),
          CustomDropDownButton(
            choosedValue: choosedValue,
            list: colorList,
            onItemSelected: onItemSelected,
          ),
        ],
      ),
    );
  }
}
