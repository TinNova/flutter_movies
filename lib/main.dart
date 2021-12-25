import 'package:flutter/material.dart';
import 'package:movies/app/locator.dart';
import 'package:movies/ui/views/detail/detail_view.dart';
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
      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id: (context) => MainScreen(),
        DetailView.id: (context) => DetailView(),
//        CastScreen.id: (context) => CastScreen(),
//        RegistrationScreen.id: (context) => RegistrationScreen(),
//        LoginScreen.id: (context) => LoginScreen(),
//        SearchScreen.id: (context) => SearchScreen()
      },
    );
  }
}
