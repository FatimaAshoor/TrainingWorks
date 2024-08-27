import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_works/screens/tips_type_screen.dart';
import 'package:training_works/services/tips_service.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  
  TipsService service = TipsService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.lightGreen,
        title: Text("Natural Beauty Tips", style: TextStyle(color: Colors.white,fontSize: 28.sp, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.lightGreen,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
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
                          return InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> TipsTypeScreen(id: snap.data![i]["id"], type: "${snap.data?[i]["type"]}" ,)));
                            },
                            child: Card(
                              child: ListTile(
                                title: Text("${snap.data?[i]["type"]}", style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),),
                                subtitle: Text("${snap.data?[i]["description"]}", style: TextStyle(fontSize: 18.sp),),
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
        ),
    );
  }
}
