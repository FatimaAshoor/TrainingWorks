import 'package:flutter/material.dart';

class MatchContent extends StatefulWidget {
  const MatchContent({super.key});

  @override
  State<MatchContent> createState() => _MatchContentState();
}

class _MatchContentState extends State<MatchContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Statistics", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          // Possession
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Possession", style: TextStyle(fontSize: 16, color: Colors.grey),),
              Text("55%", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Row(
                children: [
                  Container(height: 8,width: 80, decoration:BoxDecoration(color: Colors.black, borderRadius: BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))),),
                  Container(height: 8,width: 80, decoration:BoxDecoration(color: Colors.lime, borderRadius: BorderRadius.only(topRight: Radius.circular(6), bottomRight: Radius.circular(6))),),
                ],
              ),
              Text("45%", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

            ],
          ),
          SizedBox(height: 10,),
          // Goal attempts
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Goal attempts", style: TextStyle(fontSize: 16, color: Colors.grey),),
              Text("8", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Row(
                children: [
                  Container(height: 8,width: 80, decoration:BoxDecoration(color: Colors.black, borderRadius: BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))),),
                  Container(height: 8,width: 80, decoration:BoxDecoration(color: Colors.lime, borderRadius: BorderRadius.only(topRight: Radius.circular(6), bottomRight: Radius.circular(6))),),
                ],
              ),
              Text("4", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

            ],
          ),
          SizedBox(height: 10,),
          // Shot on goal
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Shot on goal", style: TextStyle(fontSize: 16, color: Colors.grey),),
              Text("4", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Row(
                children: [
                  Container(height: 8,width: 80, decoration:BoxDecoration(color: Colors.black, borderRadius: BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))),),
                  Container(height: 8,width: 80, decoration:BoxDecoration(color: Colors.lime, borderRadius: BorderRadius.only(topRight: Radius.circular(6), bottomRight: Radius.circular(6))),),
                ],
              ),
              Text("3", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

            ],
          ),
          SizedBox(height: 10,),
          // Corner kids
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Corner kids", style: TextStyle(fontSize: 16, color: Colors.grey),),
              Text("5", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Row(
                children: [
                  Container(height: 8,width: 80, decoration:BoxDecoration(color: Colors.black, borderRadius: BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))),),
                  Container(height: 8,width: 80, decoration:BoxDecoration(color: Colors.lime, borderRadius: BorderRadius.only(topRight: Radius.circular(6), bottomRight: Radius.circular(6))),),
                ],
              ),
              Text("5", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

            ],
          ),
          SizedBox(height: 10,),
          // Saves
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Saves", style: TextStyle(fontSize: 16, color: Colors.grey),),
              Text("4", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Row(
                children: [
                  Container(height: 8,width: 80, decoration:BoxDecoration(color: Colors.black, borderRadius: BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))),),
                  Container(height: 8,width: 80, decoration:BoxDecoration(color: Colors.lime, borderRadius: BorderRadius.only(topRight: Radius.circular(6), bottomRight: Radius.circular(6))),),
                ],
              ),
              Text("8", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

            ],
          ),
          SizedBox(height: 10,),
          // Fouls
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Fouls", style: TextStyle(fontSize: 16, color: Colors.grey),),
              Text("7", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              Row(
                children: [
                  Container(height: 8,width: 80, decoration:BoxDecoration(color: Colors.black, borderRadius: BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))),),
                  Container(height: 8,width: 80, decoration:BoxDecoration(color: Colors.lime, borderRadius: BorderRadius.only(topRight: Radius.circular(6), bottomRight: Radius.circular(6))),),
                ],
              ),
              Text("8", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

            ],
          ),
        ],
      ),
    );
  }
}
