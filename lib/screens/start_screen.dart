import 'package:flutter/material.dart';

import '../constant/colors.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: MovieColors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("START BY CREATING AN ACCOUNT" , style: TextStyle(color: MovieColors.white, fontSize: 28,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            SizedBox(height: 10),
            Text( "I'm an early bird and I'm a night owl so I'm wise and I have worms.", style: TextStyle(color: MovieColors.lightGrey, fontSize: 24,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            SizedBox(height: 30),

            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed("createAccount");
              },
              color: MovieColors.yellow,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minWidth: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'CREATE AN ACCOUNT',
                style: TextStyle(
                  color: MovieColors.black,
                  fontSize: 20, //
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),

            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed("signIn");
              },
              color: MovieColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minWidth: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'SIGN IN',
                style: TextStyle(
                  color: MovieColors.black,
                  fontSize: 20, //
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
