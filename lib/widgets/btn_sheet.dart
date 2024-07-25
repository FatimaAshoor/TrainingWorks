import 'package:flutter/material.dart';

import '../constant/colors.dart';

class CustomButtonSheet extends StatefulWidget {
  @override
  State<CustomButtonSheet> createState() => _CustomButtonSheetState();
}

class _CustomButtonSheetState extends State<CustomButtonSheet> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();


  int? activeButton = 0;
  List<IconData?> icons = [
    Icons.sports_baseball,
    Icons.sports_baseball,
    Icons.sports_baseball,
    Icons.sports_baseball,
    Icons.sports_baseball,
    Icons.sports_baseball,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: InkWell(
          child: Text("Show Bottom sheet"),

          onTap: (){
            scaffoldKey.currentState!.showBottomSheet((context) => Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only( topLeft: Radius.circular(20), topRight: Radius.circular(10))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 6,),
                  Container(
                    width: 50,
                    height: 4,
                    decoration: BoxDecoration(
                        color: AppColors.greyColor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Football", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                        TextButton(onPressed: (){}, child: Text("View all"))
                      ],
                    ),
                  ),

                  //Buttons
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    height: 76,
                    child: ListView.builder(
                      itemCount: icons.length,
                      itemBuilder: (context, i){
                        return Container(
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: activeButton == i? Colors.black: AppColors.lightGreyColor,
                              shape: BoxShape.circle
                          ),
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(icons[i], color: activeButton == i? Colors.white: AppColors.greyColor,),
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
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
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
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
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
            );
          },
        )
    );
  }
}
