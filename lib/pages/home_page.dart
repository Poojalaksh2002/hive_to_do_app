import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/model/grocery_model.dart';
import 'package:grocery_app/pages/cart_page.dart';
import 'package:grocery_app/pages/settings_page.dart';
import 'package:grocery_app/utils/grocery_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[100],
        title: Text(
          'Lets order fresh items for you',
          style: GoogleFonts.averiaSansLibre(),
        ),
      ),
      body: Consumer<GroceryModel>(builder: (context, value, child) {
        return GridView.builder(
            itemCount: value.groceryItems.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              print('Building GroceryCard for index: $index');
              return GroceryCard(
                groceryIndex: index,
                groceryName: value.groceryItems[index][0],
                groceryPrice: value.groceryItems[index][1],
                groceryImagePath: value.groceryItems[index][2],
              );
            });
      }),
      bottomNavigationBar:
          Consumer<GroceryModel>(builder: (context, value, child) {
        return BottomNavigationBar(
          onTap: (index) {
            if (index == 0) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            } else if (index == 1) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            } else if (index == 2) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            }
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Stack(children: [
                Icon(Icons.shopping_cart),
                value.cartList.isNotEmpty
                    ? Positioned(
                        top: -5,
                        right: 0,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            padding: EdgeInsets.all(4),
                            child: Text(
                              '${value.cartList.length}',
                              style: TextStyle(fontSize: 12),
                            )),
                      )
                    : Text('')
              ]),
            )
          ],
        );
      }),
    );
  }
}
