import 'package:flutter/material.dart';
import 'package:grocery_shop_app/pages/home_page.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //animated widget
          Container(height: 400,
            child: Lottie.network(
                'https://lottie.host/0df6be49-11a9-470a-a0f9-712cb26721d2/jPwRRmonGl.json'),
          ),
          const Spacer(),


          //text "We deliver grocery at your doorstep"
          Center(
            child: Text(
              'We deliver \n grocery \n at your doorstep',style: GoogleFonts.notoSerif(fontSize: 34,fontWeight: FontWeight.bold),textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),

          //text "GroceryWala gives "
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: Text('GroceryWalla gives you frest vegetable and fruits, \n Order fresh from GroceryWalla',
                  style: GoogleFonts.notoSerif(fontSize: 13,color: Colors.grey),
                  textAlign: TextAlign.center,
                )),
          ),
          const Spacer(),
          //Get started

          GestureDetector(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const HomePage();

          })),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.deepPurple,
              ),padding: const EdgeInsets.all(24),
              child: const Text('Get Started',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),


            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
