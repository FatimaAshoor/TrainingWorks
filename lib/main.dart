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
      else if(operation=='-'){
        finalResult = (num1-num2).toString();
      }
      else if(operation=='x'){
        finalResult = (num1*num2).toString();
      }
      else if(operation=='÷'){
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
      padding: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: (){
          checkPressedButton(btnText);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text("$btnText", style: TextStyle(fontSize: 35, color: textColor),),
      ),
    );
  }

  List calList = ['C', '+/-', '%', '÷', '7', '8', '9', 'x', '4', '5', '6', '-', '1', '2', '3', '+', '0', '.', '='];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(padding: EdgeInsets.all(10),
                    child: Text("$finalResult", textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 100),),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: index==16? 2.0 : 1.0,
                    ),
                    itemCount: calList.length,
                    itemBuilder: (context, i){
                      index = i;
                      return calcButton(calList[i], i==0? Colors.grey : i==1? Colors.grey : i==2? Colors.grey : i%4==3? Colors.orange : Colors.white10 , i==0? Colors.black : i==1? Colors.black : i==2? Colors.black : Colors.white);
                }),
              ),
            ],
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