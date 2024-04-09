import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_treinetic/pages/intro_page.dart';
import 'package:shopping_app_treinetic/services/product_services.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
    );
  }
}
