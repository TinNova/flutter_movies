import 'package:flutter/material.dart';

class GenericTextField extends StatelessWidget {
  GenericTextField(this.hintText, this.textEditingController);

  final String hintText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }
}
