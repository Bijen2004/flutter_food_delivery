import 'package:flutter/material.dart';
import 'package:food_delivery/models/Food.dart';

class FoodTile extends StatelessWidget {

  final Food food;
  final void Function()? onTap;

  const FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(food.name),
                        Text(food.price.toString()),
                        Text(food.description),
                      ],
                    )),
                ClipRRect(
                    borderRadius:BorderRadius.circular(8),
                    child: Image.asset(food.imagePath,height: 120,)
                ),
              ],
            ),
          ),
        ),
        Divider(
            endIndent: 25,
            indent: 25,
            color: Theme.of(context).colorScheme.tertiary,
        )
      ],
    );
  }
}
