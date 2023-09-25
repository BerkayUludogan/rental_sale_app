import 'package:flutter/material.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/vehicle_model.dart';
import 'package:rental_sale_app/feature/my_account/favorited_view.dart';
import 'package:rental_sale_app/feature/my_account/purchased_rented_view.dart';

class MyAccountView extends StatelessWidget {
  const MyAccountView({this.vehicleModel, super.key});
  final VehicleModel? vehicleModel;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.directions_car),
            ),
            Tab(icon: Icon(Icons.directions_transit)),
          ]),
        ),
        body: const TabBarView(
          children: [
            PurchasedRentedView(),
            FavoritedView(),
          ],
        ),
      ),
    );
  }
}
