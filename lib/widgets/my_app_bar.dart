import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import '../constant/colors.dart';


class MyAppBar extends StatefulWidget implements PreferredSizeWidget{
  MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>Size(double.maxFinite,80);
}

class _MyAppBarState extends State<MyAppBar> {
  int? notificationCount = 5;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25/2.5),
        child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        color: Colors.white
                      ),
                      child: Row(
                        children: [
                          Text("\$20.200", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                          SizedBox(width: 10,),
                          CircleAvatar(
                            minRadius: 14,
                            backgroundColor: AppColors.limeColor,
                            child: Text("+"),
                          )
                        ],
                      ),
                    ),

                    // Right Side
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                        // Gift Icon
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.lightGreyColor,
                              width: 2,
                            ),
                          ),

                          child: badges.Badge(
                          badgeContent: Text('${notificationCount}',
                              style: TextStyle(color: Colors.black)),
                          child: Icon(Icons.card_giftcard_outlined),
                          position: badges.BadgePosition.topEnd(top: -20),
                          badgeStyle: badges.BadgeStyle(badgeColor:  Color(0xFFE0FD15)),
                                              ),
                        ),

                        SizedBox(width: 10,),
                        // Search Icon
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.search, size: 28) ,
                        ),
                      ],
                    ),
                  ],
                ),
      )),
    );
  }
}