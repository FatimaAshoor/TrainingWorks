import 'dart:io';

import 'package:flutter/material.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override


  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String result ='0';
  String finalResult ='0';
  double num1 = 0;
  double num2 = 0;
  String operation='';

  checkPressedButton(String value){
    if(value == "C"){
      finalResult = '0';
      num1 = 0;
      num2 = 0;
      operation = '';
    }
    else if (value == "+" || value == "-" || value =="x" || value == "÷"){
      num1 = double.parse(result);
      operation = value;
      finalResult = "0";
      result = result+value;
    }
    else if(value=="."){
      if(finalResult.contains(".")){}
      else{
        finalResult = finalResult+value;
      }

    }
    else if(value=="+/-"){
      if(result.toString().contains('-')){
        result.toString().substring(1);
        finalResult = result;
      } else {
        result = '-'+result;
        finalResult = result;
      }
    }
    else if(value=="%"){
      num2 = double.parse(result);
      finalResult = (num2/100).toString();
    }
    else if(value=="="){
      num2 = double.parse(result);
      if(operation=='+'){
        finalResult = (num1+num2).toString();
      }
      if(operation=='-'){
        finalResult = (num1-num2).toString();
      }
      if(operation=='x'){
        finalResult = (num1*num2).toString();
      }
      if(operation=='÷'){
        finalResult = (num1/num2).toString();
      }
    }
    else {
      finalResult = finalResult + value;
    }
    setState(() {
      result = double.parse(finalResult).toString();
    });
  }


  Widget calcButton(String btnText, Color btnColor, Color textColor){
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        onPressed: (){
          checkPressedButton(btnText);
        },
        child: Text("$btnText", style: TextStyle(fontSize: 35, color: textColor),),
        color: btnColor,
        padding: EdgeInsets.all(20),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(padding: EdgeInsets.all(10),
                    child: Text("$finalResult", textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 100),),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  calcButton("C", Colors.grey, Colors.black),
                  calcButton("+/-", Colors.grey, Colors.black),
                  calcButton("%", Colors.grey, Colors.black),
                  calcButton("÷", Colors.orange, Colors.white),
                ],
              ),
              SizedBox(height:10,),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  calcButton("7", Colors.white10, Colors.white),
                  calcButton("8", Colors.white10, Colors.white),
                  calcButton("9", Colors.white10, Colors.white),
                  calcButton("x", Colors.orange, Colors.white),
                ],
              ),
              SizedBox(height:10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  calcButton("4", Colors.white10, Colors.white),
                  calcButton("5", Colors.white10, Colors.white),
                  calcButton("6", Colors.white10, Colors.white),
                  calcButton("-", Colors.orange, Colors.white),
                ],
              ),
              SizedBox(height:10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  calcButton("1", Colors.white10, Colors.white),
                  calcButton("2", Colors.white10, Colors.white),
                  calcButton("3", Colors.white10, Colors.white),
                  calcButton("+", Colors.orange, Colors.white),
                ],
              ),
              SizedBox(height:10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: MaterialButton(
                        onPressed: (){
                          setState(() {
                            checkPressedButton("0");
                          });
                        },
                      padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                      child: Text("0 ", style: TextStyle(fontSize: 35, color: Colors.white),),
                      color: Colors.white10,
                    ),
                  ),
                  calcButton(",", Colors.white10, Colors.white),
                  calcButton("=", Colors.orange, Colors.white),
                ],
              ),
              SizedBox(height:10,),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black26,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.calculate_outlined), label: "Edit"),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt_outlined), label: "Edit"),
          BottomNavigationBarItem(icon: Icon(Icons.keyboard_voice_outlined), label: "Edit"),
        ],
      ),
    );
  }


}