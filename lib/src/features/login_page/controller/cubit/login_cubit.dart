import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) {
    return BlocProvider.of(context);
  }

//---------------Change Password Visibility -------------------
  IconData suffix = FontAwesomeIcons.eyeLowVision ;
  bool obscureText = true;

  void changePasswordVisibility() {
    obscureText = !obscureText;
    suffix = obscureText ? FontAwesomeIcons.eyeLowVision : FontAwesomeIcons.eye;
    emit(ChangePasswordVisibilityState());
  }
}
