import 'package:flutter/material.dart';


class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
  MyAppBar({super.key, this.title, this.showBackArrow = false, this.searchingOnPressed, this.showSearch = false});

  final Widget? title;
  final bool showBackArrow;
  final bool showSearch;
  final VoidCallback? searchingOnPressed;


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25/2.5),
      child: Column(
        children: [
          Stack(
            children: [
              Positioned.fill(child: Center(child: title,)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  showBackArrow == true? BackButton(color: Colors.white,) : SizedBox(),
                  showSearch == true? IconButton(onPressed: searchingOnPressed , icon: Icon(Icons.search, color: Colors.white,)):SizedBox()
                ],
              ),

            ],
          ),
        ],
      ),
    ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>Size(double.maxFinite,80);

}