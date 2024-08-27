import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_works/screens/tips_content_screen.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.lightGreen,
        title: Text("Natural Tips For ${widget.type}", style: TextStyle(color: Colors.white,fontSize: 28.sp, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
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
                        return InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> TipsContentScreen(title:"${snap.data?[i]["title"]}" ,content: "${snap.data?[i]["content"]}",)));
                          },
                          child: Card(
                            child: ListTile(
                              title: Text("${snap.data?[i]["title"]}", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),),
                              leading: Text("${snap.data?[i]["id"]}", style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),),
                            ),
                          ),
                        );
                      });
                }
              }

              return Text("");

            }),
      ),
    );
  }
}
