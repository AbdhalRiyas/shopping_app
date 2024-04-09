import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_treinetic/pages/main_screen.dart';
import 'package:shopping_app_treinetic/services/product_services.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductService>(context, listen: false)
        .getAllProducts(context: context)
        .whenComplete(() {
      Provider.of<ProductService>(context, listen: false)
          .getCatagories(context: context)
          .whenComplete(() {
            Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
          (route) => false);
          });
    });
    return const Scaffold(
        backgroundColor: Color.fromARGB(255, 192, 58, 49),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: AssetImage('assets/images/cart.png'),
              ),
            ),
            SizedBox(height: 50),
            CircularProgressIndicator(color: Colors.white),
          ],
        ));
  }
}
