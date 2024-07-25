import 'package:flutter/material.dart';

class PremierLeaguePage extends StatefulWidget {
  const PremierLeaguePage({super.key});

  @override
  State<PremierLeaguePage> createState() => _PremierLeaguePageState();
}

class _PremierLeaguePageState extends State<PremierLeaguePage> with TickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
    int? tabLen = 4;
    int? tabIndex= 0;
    TabController tabController = TabController(length: tabLen, vsync: this);

    return Column(
        children: [
          Container(
            color: Color(0xFF8d417f),
            child: TabBar(
              onTap: (index){
                setState(() {
                  tabIndex = index;
                });
              },
              labelColor: Colors.yellow,
              unselectedLabelColor: Colors.white,
              indicatorColor: Color(0xFF8d417f),
              indicatorWeight: 1,
              controller: tabController,
              labelStyle: TextStyle(fontSize: 18),
              tabs: [
                Tab(text: "All", ),
                Tab(text: "Trending",),
                Tab(text: "Upcoming",),
                Tab(text: "World",),

              ],
            ),
          )
          ,
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Premier League", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),

                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Live
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 8, right: 8,top: 2, bottom: 2),
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Text("Live", style: TextStyle(color: Colors.white),),
                          ),
                        ],
                      ),
                      Text("VS"),
                      SizedBox(height: 4,),


                      Row(
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
                          Text("2 - 0", style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/manchester.png", width: 50,height: 50,),
                              Text("Manchester"),
                              Text("united")
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),


                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(height: 3,width: double.maxFinite,color: Colors.grey,),
                              Container(height: 3,width: 130,color: Colors.green,),

                            ],
                          ),
                          Text("22-33", style: TextStyle(color: Colors.grey))
                        ],
                      ),
                      SizedBox(height: 30,),


                      Container(
                          padding: EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text("Lorem Ipsum is simply fdgdgjgrfdfrx?")),
                      SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(onPressed: (){}, child: Text("No", style: TextStyle(color: Colors.red, fontSize: 18),)),
                          TextButton(onPressed: (){}, child: Text("Yes", style: TextStyle(color: Colors.green),)),
                        ],
                      ),

                    ],
                  ),


                ),
                SizedBox(height: 10,),

                Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${tabController.index} "+ "of " + "${tabController.length}")
                    ],
                  ),
                )

              ],
            ),
          ),
        ])
    ;
  }
}