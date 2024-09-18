import 'package:flutter/material.dart';
import 'package:training_works/screens/add_note.dart';
import 'package:training_works/screens/home.dart';
import 'package:training_works/screens/show_note.dart';

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
      initialRoute: "home",
      routes: {
        "home" : (context) => const Home(),
        "addNote" : (context) => const AddNote(),
      },
    );
  }
}
