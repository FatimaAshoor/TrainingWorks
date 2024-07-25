import 'package:flutter/material.dart';

import '../constant/colors.dart';

class WinCard extends StatefulWidget {
  const WinCard({super.key, this.isWin = true});

  final bool isWin;

  @override
  State<WinCard> createState() => _WinCardState();
}

class _WinCardState extends State<WinCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 1)
      ),
      child: Column(
        children: [

          // Win
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
            decoration: BoxDecoration(
              color: widget.isWin? Colors.green : Colors.red,
              borderRadius: BorderRadius.only( bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
            ),
            child: Text(widget.isWin? "Win" : "lose", style: TextStyle(color: Colors.white),),
          ),

          // First Row of the card
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Bets
              Column(
                children: [
                  // Chelsea
                  Row(
                    children: [
                      Image.asset("assets/images/chelsea.png", width: 46,height: 46,),
                      SizedBox(width: 6,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CHE", style: TextStyle(color: Colors.grey),),
                          Text("Chelsea"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  // Arsenal
                  Row(
                    children: [
                      Image.asset("assets/images/arsenal.png", width: 50,height: 50,),
                      SizedBox(width: 6,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("ARS", style: TextStyle(color: Colors.grey),),
                          Text("Arsenal"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 10),
              Text("FT", style: TextStyle(color: Colors.grey, fontSize: 18),),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/icons/caret-right.png", width: 20,height: 20,),
                      Text("3", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    children: [
                      Text("2", style: TextStyle(color: Colors.grey,fontSize: 28, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              ),

              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGreyColor,
                  shape: BoxShape.circle
                ),
                child: IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.analytics_outlined, color: AppColors.greyColor,),
                ),
              )
            ],
          ),

          // Divider
          Padding(padding: EdgeInsets.only(left: 10, right: 10), child: Divider(thickness: 2, color: Colors.grey,),),

          // Second Row of the card
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("assets/images/chelsea.png", width: 46,height: 46,),
                    SizedBox(width: 16,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Odds", style: TextStyle(color: Colors.grey),),
                        Text("2.56", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(width: 16,),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Stake", style: TextStyle(color: Colors.grey),),
                        Text("\$200", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(width: 16,),


                  ],
                ),

                Text(widget.isWin? "+\$500" : "-\$250", style: TextStyle(color: widget.isWin? Colors.green : Colors.red,fontSize: 28, fontWeight: FontWeight.bold),)
              ],
            ),
          )

        ],
      ),
    );;
  }
}
