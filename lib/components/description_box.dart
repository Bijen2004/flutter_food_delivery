import 'package:flutter/material.dart';

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {

    var primary = TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    var secondary = TextStyle(color: Theme.of(context).colorScheme.primary);


    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8)
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Rs. 343', style: primary,),
              Text('Delivery charge', style: secondary,),
            ],
          ),
          Column(
            children: [
              Text('15-30 min', style: primary,),
              Text('Delivery time', style: secondary),
            ],
          )
        ],
      ),
    );
  }
}
