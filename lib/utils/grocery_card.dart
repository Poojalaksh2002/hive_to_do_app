import 'package:flutter/material.dart';
import 'package:grocery_app/model/grocery_model.dart';
import 'package:provider/provider.dart';

class GroceryCard extends StatelessWidget {
  final int groceryIndex;
  String groceryName;
  String groceryPrice;
  String groceryImagePath;
  GroceryCard(
      {super.key,
      required this.groceryIndex,
      required this.groceryName,
      required this.groceryPrice,
      required this.groceryImagePath});
  @override
  Widget build(BuildContext context) {
    return Consumer<GroceryModel>(builder: (context, value, child) {
      return Card(
        color: Colors.teal[100],
        child: Column(
          children: [
            Image(
              height: 120,
              image: AssetImage('assets/images/${groceryImagePath}'),
            ),
            Text('$groceryName'),
            TextButton(
              onPressed: () {
                value.addCartItem(groceryIndex);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 18),
                child: Text(' $groceryPrice'),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.teal[300]!),
              ),
            ),
          ],
        ),
      );
    });
  }
}
