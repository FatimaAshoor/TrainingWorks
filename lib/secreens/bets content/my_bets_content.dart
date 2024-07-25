import 'package:flutter/material.dart';

import '../../widgets/win_card_widget.dart';

class MyBetsContent extends StatefulWidget {
  const MyBetsContent({super.key});

  @override
  State<MyBetsContent> createState() => _MyBetsContentState();
}

class _MyBetsContentState extends State<MyBetsContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Text("TODAY", style: TextStyle(color: Colors.grey, fontSize: 18),),
        SizedBox(height: 10,),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                WinCard(isWin: true,),
                WinCard(isWin: false,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
