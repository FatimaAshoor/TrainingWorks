import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_works/screens/tips_content_screen.dart';
import 'package:training_works/widgets/type_card_widget.dart';

import '../services/tips_service.dart';

class TipsTypeScreen extends StatefulWidget {
  final int id;
  final String type;
  const TipsTypeScreen({super.key, required this.id, required this.type});

  @override
  State<TipsTypeScreen> createState() => _TipsTypeScreenState();
}

class _TipsTypeScreenState extends State<TipsTypeScreen> {
  TipsService service = TipsService();

  List randomColor =[
  Colors.blue,
  Colors.green,
  Colors.red,
  Colors.yellow,
  Colors.brown,
    Colors.red,
    Colors.blueGrey,
    Colors.yellow,
    Colors.blue,
    Colors.pinkAccent,
    Colors.red,
    Colors.yellow,
    Colors.brown,
    Colors.red,
    Colors.blueGrey,
  ];

  List randomBackColor =[
    Colors.teal,
    Colors.purple,
    Colors.red,
    Colors.blueGrey,
    Colors.brown,
    Colors.yellow,
    Colors.lightGreenAccent,
    Colors.blue,
    Colors.pinkAccent,
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.brown,
    Colors.lightGreenAccent,
    Colors.orange,
    Colors.teal,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.lightGreen,
        title: Text("Natural Tips For ${widget.type}", style: TextStyle(color: Colors.white,fontSize: 22.sp, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: FutureBuilder(
              future: service.showTips(widget.id),
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
                          return TypeCardWidget(
                              onPress: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> TipsContentScreen(title:"${snap.data?[i]["title"]}" ,content: "${snap.data?[i]["content"]}",)));
                              },
                              barColor: randomColor[i],
                              subTitle: snap.data![i]["title"],
                              leading: (snap.data![i]["id"].toString()),
                              leadingColor: randomBackColor[i],
                              leadingNumColor: Colors.black
                          );
                        });
                  }
                }
                return Text("");

              }),
        ),
      ),
    );
  }
}
