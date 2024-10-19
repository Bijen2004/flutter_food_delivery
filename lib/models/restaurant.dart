import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/models/Food.dart';
import 'package:food_delivery/models/cart_item.dart';

class Restaurant extends ChangeNotifier{
  final List<Food> _menu = [
    Food(name: "Classic CheeseBurger", description: "CLassic burger classic taste", imagePath: "lib/images/burgers/cheese_burger.png", price: 10.99, category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avocade", price: 2.99),
        ]),
    Food(name: "Aloha Burger", description: "CLassic burger classic taste", imagePath: "lib/images/burgers/aloha_burger.jpg", price: 1.99, category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra cheese", price: 0.99),
          Addon(name: "Bacon", price: 1.99),
          Addon(name: "Avocade", price: 2.99),
        ]),
    Food(name: "Salad Curry", description: "Mix salad best flavor", imagePath: "lib/images/salads/greek_salad.png", price: 0.89, category: FoodCategory.salads,
        availableAddons: [
          Addon(name: "Extra salad", price: 1.99),
        ]),
    Food(name: "loaded fries", description: "fries full of spice", imagePath: "lib/images/sides/loadedfries_side.png", price: 0.99, category: FoodCategory.sides,
        availableAddons: [
          Addon(name: "Extra fires cheese", price: 9.99),
          Addon(name: "Extra ketchup", price: 1.99),
        ]),
  ];

  List<Food> get menu =>_menu;

  final List<CartItem> _cart = [];

  void addToCart(Food food,List<Addon> selectedAddons){
    CartItem ? cartItem = _cart.firstWhereOrNull((item){
      bool isSameFood = item.food == food;
      bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });

    if(cartItem != null){
      cartItem.quantity++;
    }
    else{
      _cart.add(
        CartItem(food: food, selectedAddons: selectedAddons)
      );
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);
    if(cartIndex != -1){
      if(_cart[cartIndex].quantity>1){
        _cart[cartIndex].quantity--;
      }else{
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }


  double getTotalPrice(){
    double total = 0.0;

    for (CartItem cartItem in _cart){
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons){
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  int getTotalItemCount(){
    int totalItemCount = 0;

    for(CartItem cartItem in _cart){
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  void clearCart(){
    _cart.clear();
    notifyListeners();
  }

}