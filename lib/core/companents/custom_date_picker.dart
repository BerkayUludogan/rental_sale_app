import 'package:flutter/cupertino.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';
import 'package:rental_sale_app/core/constants/date_constant.dart';
import 'package:rental_sale_app/core/constants/padding_constant.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/vehicle_model.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({required this.onDateTimeChanged, super.key});
  final void Function(DateTime) onDateTimeChanged;
  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) => customDatePicker;

  VehicleModel myCarModel = VehicleModel();

  Widget get customDatePicker => CupertinoButton(
        onPressed: () => showDialog(
          CupertinoDatePicker(
            initialDateTime: DateConstant.date,
            mode: CupertinoDatePickerMode.monthYear,
            onDateTimeChanged: widget.onDateTimeChanged,
          ),
        ),
        child: Text(
          '${DateConstant.date.year}',
          style: TextStyle(
            color: ColorConstant.textColor,
            fontSize: 20,
          ),
        ),
      );

  void showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 200,
        padding: PaddingConstant.onlyTopMid,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}/* (DateTime newDate) {
              setState(
                () => DateConstant.date = newDate,
              );
              myCarModel = myCarModel.copyWith(year: newDate.year);
            }, 
            */
