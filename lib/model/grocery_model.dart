import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroceryModel extends ChangeNotifier {
  List<List<dynamic>> _groceryItems = [
    ['Berries', '\$15', 'berries.png'],
    ['butter', '\$15', 'butter.png'],
    ['cheese', '\$15', 'cheese.png'],
    ['cookies', '\$15', 'cookies.png'],
    ['fish', '\$15', 'fish.png'],
    ['lemon', '\$15', 'lemon.png'],
    ['meat', '\$15', 'meat.png'],
    ['milk', '\$15', 'milk.png'],
    ['mushroom', '\$15', 'mushroom.png'],
    ['nuts', '\$15', 'nuts.png'],
    ['orange', '\$15', 'orange.png'],
    ['strawberry', '\$15', 'strawberry.png'],
  ];
  get groceryItems => _groceryItems;
  List<Map<String, dynamic>> cartList = [];

  //cart list
  void addCartItem(int index) {
    final existingItemIndex = cartList
        .indexWhere((cartItem) => cartItem['name'] == _groceryItems[index][0]);
    if (existingItemIndex == -1) {
      cartList.add({
        'name': _groceryItems[index][0],
        'price': _groceryItems[index][1],
        'cartItemImage': _groceryItems[index][2],
        'quantity': 1
      });
    } else if (existingItemIndex != -1) {
      cartList[existingItemIndex]['quantity']++;
    }
    notifyListeners();
  }

  void removeCartItem(index) {
    cartList.removeAt(index);
    notifyListeners();
  }

  void qtyIncreament(index) {
    cartList[index]['quantity']++;
    notifyListeners();
  }

  void qtyDecreament(index) {
    cartList[index]['quantity']--;
    notifyListeners();
  }

  double calcSingleItemTotal(index) {
    var res = cartList[index]['quantity'] *
        double.parse(cartList[index]['price'].replaceAll('\$', ''));
    print(res);
    return res;
  }

  double calcTotalAmount() {
    double totalPrice = 0.0;
    for (var item in cartList) {
      totalPrice +=
          double.parse(item['price'].replaceAll('\$', '')) * (item['quantity']);
    }
    return totalPrice;
  }
}
