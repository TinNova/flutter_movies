import 'package:equatable/equatable.dart';

// Events are what the view sends to the bloc/viewModel/presenter
class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginBtnClicked extends LoginEvent {
  LoginBtnClicked({
    required this.username,
    required this.password
  });

  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];
}

class RegisterBtnClicked extends LoginEvent {
  RegisterBtnClicked({
    required this.username,
    required this.password
  });

  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];
}
