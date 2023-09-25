import 'package:flutter/material.dart';
import 'package:rental_sale_app/core/companents/custom_tabbar.dart';
import 'package:rental_sale_app/core/constants/string_constant.dart';
import 'package:rental_sale_app/feature/rental_sale_view/bicycle/rental_sale_bicycle_view.dart';
import 'package:rental_sale_app/feature/rental_sale_view/car/rental_sale_car_view.dart';
import 'package:rental_sale_app/feature/rental_sale_view/motocycle/rental_sale_motocycle_view.dart';

class RentalSaleFavoriteView extends StatefulWidget {
  const RentalSaleFavoriteView({super.key});

  @override
  State<RentalSaleFavoriteView> createState() => _RentalSaleFavoriteState();
}

class _RentalSaleFavoriteState extends State<RentalSaleFavoriteView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(StringConstant.rentalSaleTitle),
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 8,
          shape: const CircularNotchedRectangle(),
          child: customTabbar(),
        ),
        body: const TabBarView(
          children: [
            RentalSaleCarView(),
            RentalSaleMotocycleView(),
            RentalSaleBicycleView(),
          ],
        ),
      ),
    );
  }
}
