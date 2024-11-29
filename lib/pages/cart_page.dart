import 'package:flutter/material.dart';
import 'package:grocery_app/model/grocery_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Consumer<GroceryModel>(
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.cartList.length,
              itemBuilder: (context, index) {
                return Stack(children: [
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                            'assets/images/${value.cartList[index]['cartItemImage']}',
                            height: 70),
                        Column(
                          children: [
                            Text('${value.cartList[index]['name']}'),
                            Container(
                              padding: EdgeInsets.all(8),
                              color: Colors.teal,
                              child: Text(
                                '${value.cartList[index]['price']}',
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    value.qtyIncreament(index);
                                  },
                                  icon: Icon(Icons.add_circle),
                                  color: Colors.orange[400],
                                ),
                                Text(
                                  '${value.cartList[index]['quantity']}',
                                ),
                                IconButton(
                                  onPressed: () {
                                    value.qtyDecreament(index);
                                  },
                                  icon: Icon(Icons.remove_circle),
                                  color: Colors.orange[400],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          '${value.calcSingleItemTotal(index)}',
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: -15,
                      right: -15,
                      child: IconButton(
                        color: Colors.redAccent,
                        icon: Icon(Icons.cancel_outlined),
                        onPressed: () {
                          value.removeCartItem(index);
                        },
                      )),
                ]);
              },
            );
          },
        ),
      ),
      bottomNavigationBar: Consumer<GroceryModel>(
        builder: (context, value, child) {
          return Container(
            padding: EdgeInsets.all(30),
            color: Colors.pink,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '\$ ${value.calcTotalAmount()}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
