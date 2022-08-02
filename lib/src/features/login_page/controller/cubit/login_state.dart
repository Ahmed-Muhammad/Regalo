part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class ChangePasswordVisibilityState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {

}
