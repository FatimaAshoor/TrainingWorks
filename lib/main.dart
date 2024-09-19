import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:training_works/models/todo_model.dart';
import 'package:training_works/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => TodoModel(),
        child: const Home(),
      ),
    );
  }
}
