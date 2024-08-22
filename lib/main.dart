import 'package:flutter/material.dart';
import 'package:training_works/screens/add_note.dart';
import 'package:training_works/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "addNote",
      routes: {
        "home" : (context) => Home(),
        "addNote" : (context) => AddNote(),
      },
    );
  }
}
