import 'package:flutter/material.dart';
import 'package:training_works/secreens/bets.dart';
import 'package:training_works/secreens/home.dart';
import 'package:training_works/secreens/page_two.dart';
import 'package:training_works/secreens/performance.dart';
import 'package:training_works/widgets/my_app_bar.dart';


import 'constant/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int? selectedIndex = 0;

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.sports_basketball_outlined,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];

  List<Widget> pages = [
    HomePage(),
    PageTwo(),
    PerformancePage(),
    BetsPage()

  ];
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(),
        body:
        pages.elementAt(selectedIndex!),
        bottomNavigationBar: navBar(),
      ),
    );
  }

  Widget navBar(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 65,
        margin: EdgeInsets.only(left: 24, right: 24, bottom: 24),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: listOfIcons.map((icon) {
              int? index = listOfIcons.indexOf(icon);
              bool isSelected = selectedIndex == index;
              return Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: isSelected? AppColors.limeColor : Colors.black,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 24 ),
                    child: Icon(icon,size: 22, color: isSelected? Colors.black : Colors.white,),
                  ),
                ),
              );
            }).toList()

        ),
      ),
    );
  }
}




