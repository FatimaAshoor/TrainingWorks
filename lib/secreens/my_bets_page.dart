import 'package:flutter/material.dart';

class MyBetsPage extends StatefulWidget {
  const MyBetsPage({super.key});

  @override
  State<MyBetsPage> createState() => _MyBetsPageState();
}

class _MyBetsPageState extends State<MyBetsPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context)  {
    TabController tabController = TabController(length: 2, vsync: this);
    return Column(
      children: [
        Container(
          color: Color(0xFF8d417f),
          child: TabBar(
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.white,
            indicatorColor: Color(0xFF8d417f),
            indicatorWeight: 1,
            controller: tabController,
            labelStyle: TextStyle(fontSize: 18),
            tabs: [
              Tab(text: "Placed Bets", ),
              Tab(text: "Past Bets",),
            ],
          ),
        )
        ,

        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/R.png", width: 50,height: 50,),
                      Text("Liverpool")
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
                      Text("2 - 0", style: TextStyle(fontWeight: FontWeight.bold),)
                      ,
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8, right: 8,top: 2, bottom: 2),
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text("abfbgujss", style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),


                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/chelsea.png", width: 50,height: 50,),
                      Text("Liverpool")
                    ],
                  ),
                ],
              ),

            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/tottenham.png", width: 50,height: 50,),
                      Text("Liverpool")
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
                      Text("2 - 0", style: TextStyle(fontWeight: FontWeight.bold),)
                      ,
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8, right: 8,top: 2, bottom: 2),
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text("abfbgujss", style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),


                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/manchestwe_city.png", width: 50,height: 50,),
                      Text("Liverpool")
                    ],
                  ),
                ],
              ),

            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/chelsea.png", width: 50,height: 50,),
                      Text("Liverpool")
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
                      Text("2 - 0", style: TextStyle(fontWeight: FontWeight.bold),)
                      ,
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8, right: 8,top: 2, bottom: 2),
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text("abfbgujss", style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),


                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 50,height: 50, child: Image.asset("assets/manchester.png", )),
                      Text("Liverpool")
                    ],
                  ),
                ],
              ),

            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/tottenham.png", width: 50,height: 50,),
                      Text("Liverpool")
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
                      Text("2 - 0", style: TextStyle(fontWeight: FontWeight.bold),)
                      ,
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8, right: 8,top: 2, bottom: 2),
                        decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text("abfbgujss", style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),


                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/chelsea.png", width: 50,height: 50,),
                      Text("Liverpool")
                    ],
                  ),
                ],
              ),

            ),
          ],
        ),
      ],
    );
  }
}