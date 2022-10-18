import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({required this.title, required this.onPressed});

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: null,
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
