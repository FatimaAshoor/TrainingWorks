import 'package:flutter/material.dart';
import 'package:training_works/home_page.dart';

class ResultPage extends StatefulWidget {
  final double bmi;
  const ResultPage({super.key, required this.bmi});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    String userState ;
    String message;

    switch (widget.bmi){
      case <= 20:
        userState = "SLIM";
        message = "You have a slim body weight.";

      case >= 50:
        userState = "FAT";
        message = "You have a fat body weight.";


      default:
        userState = "Normal";
        message = "You have a normal body weight. Good Job!";
    }

    return Scaffold(
      backgroundColor: Color(0xff0A0E21),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text("BMI Calculator", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor:  Color(0xff0A0E21) ,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                Text("Your Result", style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),),
                SizedBox(height: 30,),
                Container(
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xff1D1F33)),
                  child: Column(
                    children: [
                      Text("$userState", style: TextStyle(fontSize: 30, color: Color(0xff33DE88), fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),
                      Text("${widget.bmi}", style: TextStyle(fontSize: 100, color: Colors.white, fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),
                      Text("$message", style: TextStyle(fontSize: 20, color: Colors.white),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          MaterialButton(
              onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomePage()));
              },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Re_Calculate", style:TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),),
            ),
            minWidth: double.maxFinite,
            color: Color(0xffEB1655),

          )
        ],
      ),
    );
  }
}
