import 'package:flutter/material.dart';

class StandContent extends StatefulWidget {
  const StandContent({super.key});

  @override
  State<StandContent> createState() => _StandContentState();
}

class _StandContentState extends State<StandContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Stand Content"),
    );
  }
}
