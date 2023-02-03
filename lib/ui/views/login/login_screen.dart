import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/views/login/login_bloc.dart';
import 'package:movies/ui/views/login/login_events.dart';
import 'package:movies/ui/views/login/login_state.dart';
import '../../../widgets/textfield_widgets.dart';
import '../components/buttons.dart';
import '../main/main_screen.dart';

// Bloc Inspiration came from here:
// https://medium.com/flutter-community/flutter-bloc-for-beginners-839e22adb9f5
class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => LoginBloc(),
        child: BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
          child: LoginScreenLayout(),
        ),
      ),
    );
  }
}

class LoginScreenLayout extends StatelessWidget {
  const LoginScreenLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameTextController = TextEditingController();
    TextEditingController passwordTextController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.status.isError) {
                // Navigator.pushNamed(context, MainScreen.id);
                // show an error
              } else if (state.status.isLoginSuccess) {
                Navigator.pushNamed(context, MainScreen.id);
              }
            },
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 64.0, bottom: 16.0, left: 16.0, right: 16.0),
            child: GenericTextField('Username', usernameTextController),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0),
            child: GenericTextField('Password', passwordTextController),
          ),
          Button(
              title: "Login",
              onPressed: () {
                context.read<LoginBloc>().add(
                      LoginBtnClicked(
                        username: usernameTextController.text,
                        password: passwordTextController.text,
                      ),
                    );
              }),
          Button(title: "Register", onPressed: () {}),
        ],
      ),
    );
  }
}
