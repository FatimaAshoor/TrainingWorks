import 'package:flutter/material.dart';
import 'package:training_works/screens/add_new_product.dart';
import 'package:training_works/screens/cart_screen.dart';
import 'package:training_works/screens/products_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "products",
      routes: {
        "products" : (context) => ProductsScreen(),
        "addNewProduct" : (context) => AddNewProduct(),
        "cart" : (context) => CartScreen(),
      },
    );
  }
}