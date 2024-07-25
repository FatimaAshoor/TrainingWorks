import 'package:flutter/material.dart';

class OddsContent extends StatefulWidget {
  const OddsContent({super.key});

  @override
  State<OddsContent> createState() => _OddsContentState();
}

class _OddsContentState extends State<OddsContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Odds Content"),
    );
  }
}
