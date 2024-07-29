import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:training_works/constant/colors.dart';
import 'package:training_works/screens/auth/create_account_screen.dart';
import 'package:training_works/screens/auth/verificaion_code_screen.dart';
import 'package:training_works/screens/home_screen.dart';
import 'package:training_works/screens/auth/sign_in_screen.dart';
import 'package:training_works/screens/splash_secreen.dart';
import 'package:training_works/screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MovieColors.yellow,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: MovieColors.yellow),
        useMaterial3: true,
      ),
      home: SplashScreen(),

      routes: {
        "start" : (context) => StartScreen(),
        "createAccount" : (context) => CreateAccountScreen(),
        "verification" : (context) => VerificationCodeScreen(),
        "signIn" : (context) => SignInScreen(),
        "home" : (context) => HomeScreen(),
      },
    );
  }
}
