import 'package:flutter/material.dart';
import 'package:rental_sale_app/core/companents/custom_textfield.dart';

class CustomModelText extends StatelessWidget {
  const CustomModelText({
    required this.hintText,
    required this.onChanged,
    super.key,
  });
  final String hintText;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: hintText,
      inputType: TextInputType.name,
      action: TextInputAction.next,
      onChanged: onChanged,
    );
  }
}
