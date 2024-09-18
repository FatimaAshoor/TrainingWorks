import 'package:flutter/material.dart';
class NoteCard extends StatelessWidget {
  final Color cardColor;
  final String title;
  final String content;
  final Color colorTitle;
  final Color colorContent;
  final Function()? onTap;

  const NoteCard({super.key, required this.cardColor, required this.title, required this.content, required this.colorTitle, required this.colorContent, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: cardColor,
          ),
          child: Column(
            children: [
              Text("$title", style: TextStyle(color: colorTitle, fontSize: 28),),
              const SizedBox(height: 4,),
              Text("$content", style: TextStyle(color: colorContent, fontSize: 18), ),
            ],
          ),
        ),
      ),
    );
  }
}
