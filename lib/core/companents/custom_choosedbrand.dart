import 'package:flutter/material.dart';
import 'package:rental_sale_app/core/companents/custom_dropdown.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';
import 'package:rental_sale_app/core/constants/padding_constant.dart';
import 'package:rental_sale_app/core/extensions/context_extension.dart';

class CustomChoosedBrand extends StatelessWidget {
  const CustomChoosedBrand({
    required this.choosedValue,
    required this.list,
    required this.onItemSelected,
    required this.text,
    super.key,
  });
  final String text;
  final String choosedValue;
  final List<String> list;
  final void Function(String) onItemSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: PaddingConstant.paddinAllLow,
      decoration: BoxDecoration(border: Border.all()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: context.textTheme.titleMedium
                ?.copyWith(color: ColorConstant.textColor),
          ),
          CustomDropDownButton(
            list: list,
            onItemSelected: onItemSelected,
            choosedValue: choosedValue,
          ),
        ],
      ),
    );
  }
}
