import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  static const String id = 'detail_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Text('detail'),
        ));
  }
}
