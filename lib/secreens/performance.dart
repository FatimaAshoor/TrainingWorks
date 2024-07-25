import 'package:flutter/material.dart';
import 'package:training_works/secreens/statistics%20content/h2h_content.dart';
import 'package:training_works/secreens/statistics%20content/match_content.dart';
import 'package:training_works/secreens/statistics%20content/odds_content.dart';
import 'package:training_works/secreens/statistics%20content/stand_content.dart';

import '../constant/colors.dart';

class PerformancePage extends StatefulWidget {
  const PerformancePage({super.key});

  @override
  State<PerformancePage> createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {



  int? activeButton = 0;
  List btnTitle = ["Match", "Odds", "H2H", "Stand"];

  showContent({int? index}) {
    switch (activeButton) {
      case 1:
        return OddsContent();
      case 2:
        return H2hContent();
      case 3:
        return StandContent();
      default:
        return MatchContent();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  BackButton(),
                  SizedBox(width: 10,),
                  Text("Back", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ],
              ),
              IconButton(onPressed: (){}, icon: Image.asset("assets/icons/menu-dots.png", height: 24,width: 24,))
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey, width: 1)
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/chelsea.png", width: 50,height: 50,),
                                  Text("CHE", style: TextStyle(color: Colors.grey),),
                                  Text("Chelsea")
                                ],
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("22 july 2024", style: TextStyle(color: Colors.grey),),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text("3 : 2", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),)
                                  ,
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text("FT", style: TextStyle(color: Colors.grey),),
                                ],
                              ),


                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/arsenal.png", width: 50,height: 50,),
                                  Text("ARS", style: TextStyle(color: Colors.grey),),
                                  Text("Arsenal")
                                ],
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Divider(thickness: 1, color: Colors.grey,),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Aubameyang", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                              SizedBox(width: 10,),
                                              Text("15.39", style: TextStyle(color: Colors.grey),),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("Enzo", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                              SizedBox(width: 10,),
                                              Text("15.39", style: TextStyle(color: Colors.grey),),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 10,),
                                      Image.asset("assets/icons/football.png", height: 24,width: 24,),
                                      SizedBox(width: 10,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("25'", style: TextStyle(color: Colors.grey),),
                                              SizedBox(width: 10,),
                                              Text("Saka", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("41'", style: TextStyle(color: Colors.grey),),
                                              SizedBox(width: 10,),
                                              Text("G. Jesus", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 20,),
                                  
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // 1x
                                      Container(
                                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(26),
                                            color: AppColors.lightGreyColor
                                        ),
                                        child: Row(
                                          children: [
                                            Text("1x", style: TextStyle(fontSize: 14, color: Colors.grey),),
                                            SizedBox(width: 10,),
                                            Text("2.56", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                      ),

                                      // x
                                      Container(
                                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(26),
                                            color: AppColors.lightGreyColor
                                        ),
                                        child: Row(
                                          children: [
                                            Text("x", style: TextStyle(fontSize: 14, color: Colors.grey),),
                                            SizedBox(width: 10,),
                                            Text("1.23", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                      ),

                                      Container(
                                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(26),
                                            color: AppColors.lightGreyColor
                                        ),
                                        child: Row(
                                          children: [
                                            Text("2x", style: TextStyle(fontSize: 14, color: Colors.grey),),
                                            SizedBox(width: 10,),
                                            Text("2.36", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey, width: 1)
                      ),
                      child: Column(
                        children: [
                          // Buttons
                          Container(
                            padding: const EdgeInsets.only(left: 16),
                            height: 76,
                            child: ListView.builder(
                              itemCount: btnTitle.length,
                              itemBuilder: (context, i){
                                return Container(
                                  padding: const EdgeInsets.only(top: 14,bottom: 10, left: 4, right: 4),
                                  child: MaterialButton(
                                    minWidth: 100,
                                    onPressed: (){
                                      setState(() {
                                        activeButton = i;
                                      });
                                    },
                                    child: Text("${btnTitle[i]}", style: TextStyle(color: i == activeButton ? Colors.white : AppColors.greyColor, fontSize: 16),),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                    color: i == activeButton ? Colors.black : AppColors.lightGreyColor,
                                    elevation: 0,
                                  ),
                                );
                              },
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          //Content of Buttons
                          Container(
                            child: showContent(index: activeButton),
                          )
                        ],
                      )
                  ),
                ],
              ),
            ),
          )
        ],
      );
  }
}


