import 'package:flutter/material.dart';
import 'package:food_delivery/components/app_button.dart';
import 'package:food_delivery/models/Food.dart';

class FoodPage extends StatefulWidget {

  final Food food;
  final Map<Addon,bool> selectedAddons = {};

  FoodPage({super.key, required this.food}){
    for (Addon addon in food.availableAddons){
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

    Scaffold(

    body: SingleChildScrollView(
    child: Column(
    children: [
    Image.asset(widget.food.imagePath),
    Text(widget.food.name),
    Text(widget.food.price.toString()),
    Text(widget.food.description),
    ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: widget.food.availableAddons.length,
    itemBuilder: (context,index){
    Addon addon = widget.food.availableAddons[index];
    return CheckboxListTile(
    title: Text(addon.name),
    subtitle: Text('\$ ' + addon.price.toString()),
    value: widget.selectedAddons[addon],
    onChanged: (bool? value){
    setState(() {
    widget.selectedAddons[addon] = value!;
    });
    });
    }),
    Padding(
    padding: const EdgeInsets.symmetric(vertical: 15.0),
    child: AppButton(text: "Add to cart", onTap: (){}),
    )
    ],

    ),
    ),
    ),
        SafeArea(
          child: Container(
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_outlined),
              onPressed: ()=>Navigator.pop(context),
            ),
          ),
        )
      ],
    );
  }
}
