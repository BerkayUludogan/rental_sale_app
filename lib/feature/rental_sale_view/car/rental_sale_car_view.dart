import 'package:flutter/material.dart';
import 'package:rental_sale_app/core/companents/widgets/car_details.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_car/model/vehicle_model.dart';
import 'package:rental_sale_app/feature/rental_sale_view/car/rental_sale_car_viewmodel.dart';

class RentalSaleCarView extends StatefulWidget {
  const RentalSaleCarView({super.key});

  @override
  State<RentalSaleCarView> createState() => _RentalSaleCarViewState();
}

class _RentalSaleCarViewState extends RentalSaleCarViewModel {
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
                  builder: (context) => CarDetailsView(model: model),
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
        '${model.brand} - ${model.model!.toUpperCase()}',
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
          setState(() {});
          model.isFavorite = !model.isFavorite!;
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


        /*   IconButton(
        icon: const Icon(
          Icons.favorite_outline_rounded,
        ),
        onPressed: () {
          setState(() {

          });
          print('${model.brand} favoriye eklendi.');
        },
      ), */