import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rental_sale_app/core/companents/custom_textfield.dart';
import 'package:rental_sale_app/core/utils/textformfield_format.dart';

class CustomPriceTextField extends StatelessWidget {
  const CustomPriceTextField(
      {required this.onChanged, required this.hintText, super.key});
  final void Function(String)? onChanged;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: hintText,
      inputType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CurrencyInputFormatter(),
      ],
      action: TextInputAction.done,
      onChanged: onChanged,
    );
  }
}
