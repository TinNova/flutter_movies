import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/views/login/login_events.dart';
import 'package:movies/ui/views/login/login_state.dart';

import '../../../app/locator.dart';
import '../../../domain/user_interactor.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginBtnClicked>(_mapLoginBtnClickedEventToState);
    on<RegisterBtnClicked>(_mapRegisterBtnUserEventToState);
  }

  final _userInteractor = locator<UserInteractor>();

  void _mapLoginBtnClickedEventToState(LoginBtnClicked event,
      Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));

    try {
      await _userInteractor.getUser(event.username, event.password);
      emit(state.copyWith(status: LoginStatus.loginSuccess));
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(
          status: LoginStatus.error,
          errorMessage: "username or password entered incorrectly"));
    }
  }

  void _mapRegisterBtnUserEventToState(RegisterBtnClicked event,
      Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));

    try {
      await _userInteractor.registerUser(event.username, event.password);
      emit(state.copyWith(status: LoginStatus.registerSuccess));
    } catch (error, stacktrace) {
      print(stacktrace);
      emit(state.copyWith(
          status: LoginStatus.error,
          errorMessage: "Couldn't register user, try again"));
    }
  }
}
