import 'package:flutter/material.dart';
import 'package:rental_sale_app/core/constants/color_constant.dart';
import 'package:rental_sale_app/core/constants/string_constant.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_home/add_listing_home_view.dart';

import 'package:rental_sale_app/feature/my_account/my_account_view.dart';
import 'package:rental_sale_app/feature/rental_sale_view/home/rental_sale_favo_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: Column(
        children: [
          //    _titleText(context),
          const SizedBox(
            height: 20,
          ),
          _cards(
            context,
            title: StringConstant.salesRental,
            subtitle: StringConstant.salesRentalDescription,
            widget: const RentalSaleFavoriteView(),
          ),
          _divider(),
          _cards(
            context,
            title: StringConstant.addListing,
            subtitle: StringConstant.addListingDescription,
            widget: const AddListingHomeView(),
          ),
          _divider(),
          _cards(
            context,
            title: StringConstant.myAccount,
            subtitle: StringConstant.myAccountDescription,
            widget:  MyAccountView(),
          ),
        ],
      ),
    );
  }

  Divider _divider() {
    return const Divider(
      color: Colors.grey,
    );
  }

  Card _cards(
    BuildContext context, {
    required String title,
    required String subtitle,
    required Widget widget,
  }) {
    return Card(
      color: ColorConstant.floatActionColor,
      child: ListTile(
        onTap: () => Navigator.of(context).push(
          // ignore: inference_failure_on_instance_creation
          MaterialPageRoute(
            builder: (context) => widget,
          ),
        ),
        leading: Icon(
          Icons.car_rental,
          color: ColorConstant.textColor,
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: ColorConstant.textColor),
        ),
        trailing: Icon(
          Icons.add_outlined,
          color: ColorConstant.textColor,
        ),
      ),
    );
  }
}
