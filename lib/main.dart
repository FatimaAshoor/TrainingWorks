import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: child,
          routes: {
            "products" : (context) => ProductsScreen(),
            "addNewProduct" : (context) => AddNewProduct(),
            "cart" : (context) => CartScreen(),
          },
        );
      },
      child: ProductsScreen(),
    );
  }
}