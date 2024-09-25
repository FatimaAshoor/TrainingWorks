import 'package:flutter/material.dart';
class NoteCard extends StatelessWidget {
  final Color cardColor;
  final String title;
  final String content;
  final Color colorTitle;
  final Color colorContent;
  final Function()? onTap;
  final Function()? onPressedIcon;

  const NoteCard({super.key, required this.cardColor, required this.title, required this.content, required this.colorTitle, required this.colorContent, this.onTap, this.onPressedIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: cardColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.delete_rounded),
                  onPressed: onPressedIcon,
                ),
                Text("$title", style: TextStyle(color: colorTitle, fontSize: 28),),
                const SizedBox(height: 4,),
                Text("$content", style: TextStyle(color: colorContent, fontSize: 18), ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
