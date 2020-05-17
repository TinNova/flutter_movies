import 'package:flutter/material.dart';

class TitleMedium extends StatelessWidget {
  TitleMedium(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
