import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TipsContentScreen extends StatefulWidget {
  final String title;
  final String content;
  const TipsContentScreen({super.key, required this.title, required this.content});

  @override
  State<TipsContentScreen> createState() => _TipsContentScreenState();
}

class _TipsContentScreenState extends State<TipsContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Colors.lightGreen,
        title: Text("Details", style: TextStyle(color: Colors.white, fontSize: 28.sp, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.sp),
              margin: EdgeInsets.symmetric(horizontal: 50.sp),
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text("${widget.title}", style: TextStyle(fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.bold),overflow: TextOverflow.fade,),
            ),
            Container(
              padding: EdgeInsets.all(10.sp),
              margin: EdgeInsets.symmetric(horizontal: 22.sp),
              child: Text("${widget.content}"),
            )
          ],
        ),
      ),
    );
  }
}
