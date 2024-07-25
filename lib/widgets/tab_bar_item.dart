import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  const TabBarItem({super.key, this.text,  this.active = false,  });

  final String? text;
  final bool active;
  //final TabBarIndicatorSize? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
      decoration: BoxDecoration(
          color: active? Colors.white : null,
          borderRadius: BorderRadius.circular(6)
      ),
      child: Text("$text"),
    );
  }
}
