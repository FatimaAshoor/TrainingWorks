import 'package:flutter/material.dart';
import 'package:training_works/constant/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int? selectedButton =0;

  @override
  void initState() {
    super.initState();

    if(selectedButton==2){
      Future.delayed(Duration(seconds: 2), (){
        Navigator.of(context).pushNamed("start");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: MovieColors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Title
            selectedButton ==0? Text("WATCH ON ANY DEVICE" , style: TextStyle(color: MovieColors.white, fontSize: 28,fontWeight: FontWeight.bold)):
                selectedButton == 1? Text( "UNLIMITED ENTERTAINMENT", style: TextStyle(color: MovieColors.white, fontSize: 28,fontWeight: FontWeight.bold)):
              selectedButton == 2? Text("NO ANNOYING CONTRACTS" , style: TextStyle(color: MovieColors.white, fontSize: 28,fontWeight: FontWeight.bold)):
              Text(""),
            SizedBox(height: 10),

            // Sub-Title
            selectedButton ==0? Text("Connect to using your favorite devices.", style: TextStyle(color: MovieColors.lightGrey, fontSize: 24,fontWeight: FontWeight.bold)) :
                selectedButton == 1? Text( "I'm an early bird and I'm a night owl so I'm wise and I have worms.", style: TextStyle(color: MovieColors.lightGrey, fontSize: 24,fontWeight: FontWeight.bold)):
            selectedButton == 2? Text("I'm an early bird and I'm a night owl so I'm wise and I have worms." , style: TextStyle(color: MovieColors.lightGrey, fontSize: 24,fontWeight: FontWeight.bold)):
            Text(""),

            SizedBox(height: 50),

            //Buttons
            Padding(
              padding: const EdgeInsets.only(right: 290),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(onTap: (){
                    setState(() {
                      selectedButton =0;
                    });
                  },child: CircleAvatar(minRadius: 6, backgroundColor:selectedButton==0? MovieColors.yellow : MovieColors.white,)),
                  InkWell(onTap: (){
                    setState(() {
                      selectedButton =1;
                    });
                  },child: CircleAvatar(minRadius: 6, backgroundColor: selectedButton==1? MovieColors.yellow : MovieColors.white,)),
                  InkWell(onTap: (){
                    setState(() {
                      selectedButton =2;
                    });
                  },child: CircleAvatar(minRadius: 6, backgroundColor: selectedButton==2? MovieColors.yellow : MovieColors.white,)),
                    ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
