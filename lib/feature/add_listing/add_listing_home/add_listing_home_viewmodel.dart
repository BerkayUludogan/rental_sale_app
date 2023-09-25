import 'package:flutter/material.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_bicycle/add_listing_bicycle_view.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/add_listing_car_view.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_motocycle/add_listing_motocycle_view.dart';

class AddListingViewModel {
  AddListingViewModel._();

  static final AddListingViewModel _instance = AddListingViewModel._();

  static AddListingViewModel get instance => _instance;

  VoidCallback? whenComplate;

  TabBarView mainBody() {
    return const TabBarView(
      children: [
        AddListingCarView(),
        AddListingMotocycleView(),
        AddListingBicycleView()
      ],
    );
  }
}
