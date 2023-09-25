import 'package:flutter/material.dart';
import 'package:rental_sale_app/core/constants/string_constant.dart';

enum TabbarItems {
  car(StringConstant.car),
  motorcycle(StringConstant.motorcycle),
  bicycle(StringConstant.bicycle);

  const TabbarItems(this.value);
  final String value;
}

TabBar customTabbar() {
  return TabBar(
    
    tabs: List.generate(
      
      TabbarItems.values.length,
      (index) => Tab(
        child: Text(
          TabbarItems.values[index].value,
        ),
      ),
    ),
  );
}
