import 'package:flutter/material.dart';
import 'package:grocery_shop_app/pages/cart_page.dart';

class CartModel extends ChangeNotifier {
  // List of items on sale
  final List<List<dynamic>> _shopItems = const [
    // [itemName, itemPrice, imagePath, color]
    ["Avocado", "4.00", "assets/avocado.png", Colors.green],
    ["Banana", "4.50", "assets/banana.png", Colors.yellow],
    ["Chicken", "2.80", "assets/chicken.png", Colors.brown],
    ["Carrot", "1.00", "assets/carrot.png", Colors.orangeAccent],
    ["StrawBerry", "5.00", "assets/strawberry.png", Colors.red],
    ["Watermelon", "4.00", "assets/watermelon.png", Colors.redAccent],
    ["White Bread", "2.50", "assets/whitebread.png", Colors.brown],
  ];

  // List of cart items
  List<List<dynamic>> _cartItems = [];

  List<List<dynamic>> get cartItems => _cartItems;

  List<List<dynamic>> get shopItems => _shopItems;

  // Add item to cart
  void addItemToCart(BuildContext context, int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();

    double total = double.parse(calculateTotal());
    String totalPrice = total.toStringAsFixed(2);

    final snackBar = SnackBar(
      content: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              _shopItems[index][3], // Adjust the opacity to make it slightly lighter
              Colors.white,
            ],
          ),


          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Image.asset(
              _shopItems[index][2],
              height: 32,
              width: 32,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                'Item Added to cart - \n Cart Total: \$$totalPrice'+'  ',
                style: TextStyle(color: Colors.black),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'View Cart',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      duration: Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  // Remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // Calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1].toString());
    }
    return totalPrice.toStringAsFixed(2);
  }
}
