import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CardWidget extends StatelessWidget {
  final Function() onPress;
  final Color barColor;
  final String? title;
  final String subTitle;
  const CardWidget({super.key, required this.onPress, required this.barColor, this.title, required this.subTitle,});

  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.lightGreen.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 76.sp,
              width: 4,
              color: barColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${title}", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),),
                  Text("${subTitle}", style: TextStyle(fontSize: 16.sp),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
