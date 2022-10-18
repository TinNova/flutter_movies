import 'package:flutter/material.dart';

import '../base_view.dart';
import '../components/buttons.dart';
import '../main/main_screen.dart';
import 'login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        onViewModelCreated: (viewModel) {},
        builder: (context, mainViewModel, child) => Scaffold(
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 64.0, bottom: 8.0, left: 16.0, right: 16.0),
                    child: TextField(
                      decoration:
                          new InputDecoration.collapsed(hintText: 'Username'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 32.0, bottom: 8.0, left: 16.0, right: 16.0),
                    child: TextField(
                      decoration:
                          new InputDecoration.collapsed(hintText: 'Password'),
                    ),
                  ),
                  Button(
                      title: "Login",
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          MainScreen.id,
                        );
                      }),
                  Button(title: "Register", onPressed: () {}),
                ],
              ),
            ));
  }
}
