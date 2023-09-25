import 'package:flutter/material.dart';

@immutable
final class PaddingConstant {
  const PaddingConstant._();
  static EdgeInsets paddinAllLow = const EdgeInsets.all(4);
  static EdgeInsets paddingAllHigh = const EdgeInsets.all(16);
  static EdgeInsets scaffoldPadding =
      const EdgeInsets.symmetric(horizontal: 12);
  static EdgeInsets onlyRightLow = const EdgeInsets.only(right: 3);
  static EdgeInsets onlyTopMid = const EdgeInsets.only(top: 6);
}
