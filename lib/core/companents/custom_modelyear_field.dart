import 'package:flutter/material.dart';
import 'package:rental_sale_app/core/companents/custom_date_picker.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';
import 'package:rental_sale_app/core/constants/padding_constant.dart';
import 'package:rental_sale_app/core/extensions/context_extension.dart';

class CustomModelYearField extends StatelessWidget {
  const CustomModelYearField({
    required this.onDateTimeChanged,
    required this.text,
    super.key,
  });
  final void Function(DateTime) onDateTimeChanged;
  final String text;
  @override
  Widget build(BuildContext context) {
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
          CustomDatePicker(
            onDateTimeChanged: onDateTimeChanged,
          ),
        ],
      ),
    );
  }
}
