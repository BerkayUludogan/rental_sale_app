/* import 'package:flutter/material.dart';
import 'package:rental_sale_app/feature/add_listing/add_listing_home/add_listing_home_view.dart';

typedef OnPressed = void Function();

class IconButtonFavorite extends StatelessWidget {
  OnPressed onPressed;
   IconButtonFavorite({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        model.isFavorite!
            ? Icons.favorite_rounded
            : Icons.favorite_outline_rounded,
        color: model.isFavorite! ? Colors.red : Colors.black,
      ),
      onPressed: onPressed,
    );
  }
}
/* () {
          setState(() {
            model.isFavorite = !model.isFavorite!;
          });
        }, */ */