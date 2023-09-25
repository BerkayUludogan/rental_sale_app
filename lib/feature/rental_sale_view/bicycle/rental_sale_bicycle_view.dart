import 'package:flutter/material.dart';
import 'package:rental_sale_app/core/companents/widgets/bicycle_details.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_bicycle/model/bicycle_model.dart';
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
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                // ignore: inference_failure_on_instance_creation
                MaterialPageRoute(
                  builder: (context) => BicycleDetailsView(model: model),
                ),
              );
            },
            child: _baseCard(model),
          );
        },
      ),
    );
  }

  Card _baseCard(BicycleModel model) {
    return Card(
      child: ListTile(
        leading: _leading(model),
        title: _title(model),
        subtitle: _subTitle(model),
        trailing: _trailing(model),
      ),
    );
  }

  IconButton _trailing(BicycleModel model) {
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

  Text _subTitle(BicycleModel model) {
    return Text(
      model.price.toString(),
    );
  }

  Text _title(BicycleModel model) {
    return Text(
      '${model.brand?.toUpperCase()} - ${model.frameType?.toUpperCase()} ',
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }

  CircleAvatar _leading(BicycleModel model) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      child: Text(
        model.year.toString(),
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Future<void> _savedFavorite(BicycleModel model) async {
    await cacheManager.putItem(
      model.id!,
      model,
    );
  }
}
