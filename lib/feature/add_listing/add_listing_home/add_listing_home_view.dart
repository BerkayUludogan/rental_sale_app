import 'package:flutter/material.dart';
import 'package:rental_sale_app/core/companents/custom_tabbar.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';
import 'package:rental_sale_app/core/constants/string_constant.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_home/add_listing_home_viewmodel.dart';

Function? onPressed;

class AddListingHomeView extends StatefulWidget {
  const AddListingHomeView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddListingHomeViewState createState() => _AddListingHomeViewState();
}

class _AddListingHomeViewState extends State<AddListingHomeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: _scaffold(),
    );
  }

  Widget _scaffold() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.backgroundColor,
      appBar: _appBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: _floatingActionButton(),
      bottomNavigationBar: _bottomAppBar(),
      body: AddListingViewModel.instance.mainBody(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text(StringConstant.addListing),
    );
  }

  FloatingActionButton _floatingActionButton() => FloatingActionButton.small(
        onPressed: () {
          AddListingViewModel.instance.whenComplate?.call();
        },
        backgroundColor: ColorConstant.floatActionColor,
        child: const Icon(Icons.add),
      );

  BottomAppBar _bottomAppBar() => BottomAppBar(
        notchMargin: -5,
        child: customTabbar(),
      );
//void Function(String) onPressed;
}
