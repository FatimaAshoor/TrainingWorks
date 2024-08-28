import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_works/screens/tips_type_screen.dart';
import 'package:training_works/services/tips_service.dart';
import 'package:training_works/widgets/card_widget.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  
  TipsService service = TipsService();
  List randomColor =[
    Colors.blue,
    Colors.green,
    Colors.red,
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.lightGreen,
        title: Text("Natural Beauty Tips", style: TextStyle(color: Colors.white,fontSize: 26.sp, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(86),
                        bottomRight: Radius.circular(86)),
                  ),
                  ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.white70,
                ),
              ),
            ],
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            height: 350.sp,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child:  FutureBuilder(
                future: service.showTipsType(),
                builder: (context, snap){
                  if(snap.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }
                  else if (snap.connectionState==ConnectionState.done){
                    if(snap.hasError){
                      return Center(child: Text("ERROR", style: TextStyle(fontSize: 30.sp),),);
                    }
                    if(snap.hasData){
                      return ListView.builder(
                          itemCount: snap.data!.length,
                          itemBuilder: (context, i){
                            return CardWidget(
                                    onPress: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> TipsTypeScreen(id: snap.data![i]["id"], type: "${snap.data?[i]["type"]}" ,)));
                                    },
                                barColor: randomColor[i],
                                    title: snap.data?[i]["type"],
                                    subTitle: snap.data?[i]["description"]);
                          });
                    }
                  }
                  return Text("");

                }),
          ),
        ],
      ),
    );
  }
}
