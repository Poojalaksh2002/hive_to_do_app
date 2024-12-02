import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

class GroceryModel extends ChangeNotifier {
  Box<Map<dynamic, dynamic>> openedCartBox = Hive.box('CartBoxLocal');

  GroceryModel() {
    loadHivedCartItems();
  }

  loadHivedCartItems() {
    cartList = openedCartBox.values
        .map((item) => Map<String, dynamic>.from(item))
        .toList();
    print('came to hived');
    notifyListeners();
  }

  saveCartItemsToHiveBox() {
    openedCartBox.clear();
    for (int i = 0; i < cartList.length; i++) {
      openedCartBox.put(i, cartList[i]);
    }
  }

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
    saveCartItemsToHiveBox();
    notifyListeners();
  }

  void removeCartItem(index) {
    cartList.removeAt(index);
    saveCartItemsToHiveBox();
    notifyListeners();
  }

  void qtyIncreament(index) {
    cartList[index]['quantity']++;
    saveCartItemsToHiveBox();
    notifyListeners();
  }

  void qtyDecreament(index) {
    if (cartList[index]['quantity'] > 1) {
      cartList[index]['quantity']--;
    } else {
      cartList[index]['quantity'] == 1;
    }

    saveCartItemsToHiveBox();
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
