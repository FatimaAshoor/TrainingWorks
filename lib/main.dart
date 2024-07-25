import 'package:flutter/material.dart';
import 'package:training_works/secreens/home_page.dart';
import 'package:training_works/secreens/my_bets_page.dart';
import 'package:training_works/secreens/premier_league_page.dart';
import 'package:training_works/secreens/profile_page.dart';
import 'package:training_works/widgets/app_bar_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? selectedIndex = 0;

  List<Widget> pages = [
    HomePage(),
    MyBetsPage(),
    PremierLeaguePage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    Color pur = Color(0xFF8d417f);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: selectedIndex ==0? MyAppBar(
            title: Text.rich(TextSpan(
                text: "Sport",
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
                children: [TextSpan(
                  text: "Bet",
                  style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                )]
            ))) :
        selectedIndex ==1? MyAppBar(
            showSearch: true,
            title: Text("My Bets", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),)
        ):
        selectedIndex ==2? MyAppBar(
          title: Text("SOCCER", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),),
          showBackArrow: true,
          showSearch: true,
        ):
        selectedIndex ==3? MyAppBar(): null,


        body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(height: 100,
                    color: pur,),
                  pages.elementAt(selectedIndex!),
                ],
              ),
            )

        ),

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor:pur,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 16,
          unselectedFontSize: 16,
          unselectedLabelStyle: TextStyle(color: Colors.black26),

          onTap: (value){
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.chrome_reader_mode_outlined), label: "category") ,
            BottomNavigationBarItem(icon: Icon(Icons.mic), label: "My Bets") ,
            BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: "messages") ,
            BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: "profile") ,
          ],
        ),

      ) ,
    );
  }
}