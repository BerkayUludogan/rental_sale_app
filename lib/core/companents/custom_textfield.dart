import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';
import 'package:rental_sale_app/core/constants/padding_constant.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.hintText,
    required this.inputType,
    required this.action,
    this.icon,
    this.prefix,
    this.controller,
    this.labelText,
    super.key,
    this.inputFormatters,
    this.onChanged,
  });
  final TextEditingController? controller;
  final String? labelText;
  final List<TextInputFormatter>? inputFormatters;
  final Icon? icon;
  final String hintText;
  final String? prefix;
  final TextInputType inputType;
  final TextInputAction action;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) => customField;
  final FocusNode _myFocusNode = FocusNode();
  @override
  void dispose() {
    _myFocusNode.dispose();
  }

  Widget get customField => Padding(
        padding: PaddingConstant.onlyRightLow,
        child: TextFormField(
          focusNode: _myFocusNode,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            prefixText: prefix,
            prefixStyle: TextStyle(color: ColorConstant.textColor),
            icon: icon,
            labelText: labelText,
            hintText: hintText,
            hintStyle: TextStyle(color: ColorConstant.hintTextColor),
          ),
          keyboardType: inputType,
          textInputAction: action,
        ),
      );
}
