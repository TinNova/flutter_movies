import 'package:flutter/material.dart';
import 'package:movies/app/locator.dart';
import 'package:movies/ui/views/detail/detail_view.dart';
import 'package:movies/ui/views/login/login_screen.dart';
import 'app/sqlite.dart';
import 'ui/views/main/main_screen.dart';

void main() {
  setupLocator();
  setupSQLite();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: MainScreen(),
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        MainScreen.id: (context) => MainScreen(),
        DetailView.id: (context) => DetailView(),
//        CastScreen.id: (context) => CastScreen(),
//        RegistrationScreen.id: (context) => RegistrationScreen(),
//        SearchScreen.id: (context) => SearchScreen()
      },
    );
  }
}
