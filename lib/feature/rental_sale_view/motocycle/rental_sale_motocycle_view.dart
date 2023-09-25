import 'package:flutter/material.dart';
import 'package:rental_sale_app/core/companents/widgets/motocycle_details.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/vehicle_model.dart';
import 'package:rental_sale_app/feature/rental_sale_view/motocycle/rental_sale_motocycle_viewmodel.dart';

class RentalSaleMotocycleView extends StatefulWidget {
  const RentalSaleMotocycleView({super.key});

  @override
  State<RentalSaleMotocycleView> createState() =>
      _RentalSaleMotocycleViewState();
}

class _RentalSaleMotocycleViewState extends RentalSaleMotocycleViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: vehicleModelList.length,
        itemBuilder: (BuildContext context, int index) {
          final model = vehicleModelList[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                // ignore: inference_failure_on_instance_creation
                MaterialPageRoute(
                  builder: (context) => MotocycleDetailsView(model: model),
                ),
              );
            },
            child: Card(
              child: _baseListTile(model, index),
            ),
          );
        },
      ),
    );
  }

  ListTile _baseListTile(VehicleModel model, int index) {
    return ListTile(
      leading: Text(
        model.year.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      title: Text(
        '${model.brand!.toUpperCase()} - ${model.model!.toUpperCase()}',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        model.price.toString(),
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
      trailing: IconButton(
        icon: Icon(
          model.isFavorite!
              ? Icons.favorite_rounded
              : Icons.favorite_outline_rounded,
          color: model.isFavorite! ? Colors.red : Colors.black,
        ),
        onPressed: () async {
          setState(() {
            model.isFavorite = !model.isFavorite!;
          });
          await _savedFavorite(model);
        },
      ),
    );
  }

  Future<void> _savedFavorite(VehicleModel model) async {
    await cacheManager.putItem(
      model.id!,
      model,
    );
  }
}
