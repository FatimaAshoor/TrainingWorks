import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'bets content/my_bets_content.dart';
import 'bets content/statistics_content.dart';

class BetsPage extends StatefulWidget {
  const BetsPage({super.key});

  @override
  State<BetsPage> createState() => _BetsPageState();
}

class _BetsPageState extends State<BetsPage> with TickerProviderStateMixin{


  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    int? _selectedIndex = 0;
    //var tabSize = TabBarIndicatorSize.tab;
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Performance", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                // Tab Bar
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: AppColors.lightGreyColor, borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                        padding: EdgeInsets.all(5),
                        child: TabBar(
                            unselectedLabelColor: AppColors.greyColor,
                            labelColor: Colors.black87,
                            indicatorColor:Colors.white,
                            indicatorWeight: 3,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6)
                            ),
                            controller: _tabController,
                            tabs: [
                              Tab(text: "My Best",),
                              Tab(text: "Statistics"),
                            ]),
                      ),
                ),

                // Tab Bar View
                Expanded(
                  child: Container(
                      width: double.maxFinite,
                      child: TabBarView(
                        controller: _tabController,
                        children:
                        [
                          MyBetsContent(),
                          StatisticsContent(),
                        ],
                      )
                  ),
                ),
              ],
            ),
          );
  }
}
