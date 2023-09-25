import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class BaseView extends StatelessWidget {
  const BaseView({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: child,
    );
  }
}
