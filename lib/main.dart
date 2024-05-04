import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery_shop_app/model/cart_model.dart';
import 'package:grocery_shop_app/pages/intro_page.dart';
import 'package:grocery_shop_app/pages/razorpay_payment.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class  MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CartModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RazorPayPage(),

      ),
    );
  }
}