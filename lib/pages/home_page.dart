import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_treinetic/components/product_card.dart';
import 'package:shopping_app_treinetic/services/product_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/homeimg.png'),
           ProductCard(productList: Provider.of<ProductService>(context).productList),
          ],
        ),
      ),
    );
  }
}
