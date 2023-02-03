import 'package:equatable/equatable.dart';

// abstract class LoginState extends Equatable {
//   @override
//   List<Object> get props => [];
// }
//
// class LoginInitState extends LoginState {}
//
// class LoginLoading extends LoginState {}
//
// class LoginSuccess extends LoginState {}
//
// class LoginFailure extends LoginState {}


enum LoginStatus {initial, loginSuccess, error, loading }

extension LoginStatusX on LoginStatus {
  bool get isLoginSuccess => this == LoginStatus.loginSuccess;
  bool get isRegisterSuccess => this == LoginStatus.loginSuccess;
  bool get isError => this == LoginStatus.error;
  bool get isLoading => this == LoginStatus.loading;
}

// The state contains objects we want to send to the view
// For LoginState the options are a loginState and an errorMessage
class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    String errorMessage = "",
  })
      : errorMessage = errorMessage;

  final String errorMessage;
  final LoginStatus status;

  @override
  List<Object?> get props => [status, errorMessage];

  LoginState copyWith({
    String? errorMessage,
    LoginStatus? status,
  }) {
    return LoginState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
    );
  }
}