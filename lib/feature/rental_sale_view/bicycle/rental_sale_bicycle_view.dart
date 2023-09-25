import 'package:flutter/material.dart';
import 'package:rental_sale_app/feature/rental_sale_view/bicycle/rental_sale_bicycle_viewmodel.dart';

class RentalSaleBicycleView extends StatefulWidget {
  const RentalSaleBicycleView({super.key});

  @override
  State<RentalSaleBicycleView> createState() => _RentalSaleBicycleViewState();
}

class _RentalSaleBicycleViewState extends RentalSaleBicycleViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: bicycleModelList.length,
        itemBuilder: (BuildContext context, int index) {
          final model = bicycleModelList[index];
          return Card(
            child: ListTile(
              leading: Text(
                model.year.toString(),
              ),
              title: Text(model.brand?.toUpperCase() ?? ''),
              subtitle: Text(
                model.frameType?.toUpperCase() ?? '',
              ),
              trailing: Text(
                model.price.toString(),
                style: const TextStyle(fontSize: 15, color: Colors.red),
              ),
            ),
          );
        },
      ),
    );
  }
}
