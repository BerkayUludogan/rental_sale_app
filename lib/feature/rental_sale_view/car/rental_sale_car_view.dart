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
      leading: _leading(model),
      title: _title(model),
      subtitle: _subTitle(model),
      trailing: _trailing(model),
    );
  }

  IconButton _trailing(VehicleModel model) {
    return IconButton(
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
    );
  }

  Text _subTitle(VehicleModel model) {
    return Text(
      model.price.toString(),
      style: const TextStyle(
        fontSize: 15,
      ),
    );
  }

  Text _title(VehicleModel model) {
    return Text(
      '${model.brand} - ${model.model!.toUpperCase()}',
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }

  CircleAvatar _leading(VehicleModel model) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      child: Text(
        model.year.toString(),
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeight.bold),
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
