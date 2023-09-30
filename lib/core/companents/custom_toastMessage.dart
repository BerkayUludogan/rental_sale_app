/* import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToastMessage extends StatefulWidget {
  const CustomToastMessage({super.key});

  @override
  State<CustomToastMessage> createState() => _CustomToastMessageState();
}

class _CustomToastMessageState extends State<CustomToastMessage> {
  FToast? fToast;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return showCustomToast;
  }

  Widget get showCustomToast {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.blueGrey,
      ),
      child: const Text(
        'Araç İlana Eklendi ',
        style: TextStyle(color: Colors.white),
      ),
    );

    fToast?.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 1),
    );
    return toast;
  }
}
 */