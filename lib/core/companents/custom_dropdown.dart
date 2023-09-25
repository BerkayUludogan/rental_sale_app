import 'package:flutter/material.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';

// ignore: must_be_immutable
class CustomDropDownButton extends StatelessWidget {
  CustomDropDownButton({
    required this.list,
    required this.onItemSelected,
    required this.choosedValue,
    super.key,
  });

  final String choosedValue;
  final List<String> list;
  void Function(String) onItemSelected;

  @override
  Widget build(BuildContext context) => customDropDown;

  Widget get customDropDown => DropdownButton<String>(
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value.toUpperCase()),
          );
        }).toList(),
        style: TextStyle(color: ColorConstant.textColor),
        value: choosedValue,
        onChanged: (value) => onItemSelected.call(value!),
      );
}
