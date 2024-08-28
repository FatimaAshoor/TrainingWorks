import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TypeCardWidget extends StatelessWidget {
  final Function() onPress;
  final Color barColor;
  final String subTitle;
  final String leading;
  final Color leadingColor;
  final Color leadingNumColor;
  const TypeCardWidget({super.key, required this.onPress, required this.barColor, required this.subTitle, required this.leading, required this.leadingColor, required this.leadingNumColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 20.sp),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 76.sp,
                  width: 4,
                  color: barColor,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: CircleAvatar(
                    minRadius: 14,
                    backgroundColor: leadingColor,
                    child: Text("$leading", style: TextStyle(color: leadingNumColor),),
                  ),
                ),
                Text("${subTitle}", style: TextStyle(fontSize: 16.sp), maxLines: 1,overflow: TextOverflow.fade,),
              ],
            ),
            IconButton(onPressed: onPress, icon: Icon(Icons.arrow_forward_ios))
          ],
        ),
      );
  }
}
