import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

//---------------Change Password Visibility -------------------
  IconData suffix = FontAwesomeIcons.eyeLowVision;
  IconData suffixConfirm = FontAwesomeIcons.eyeLowVision;

  bool obscureText = true;
  bool obscureTextConfirm = true;

  void changePasswordVisibility() {
    obscureText = !obscureText;
    suffix = obscureText ? FontAwesomeIcons.eyeLowVision : FontAwesomeIcons.eye;
    emit(ChangePasswordVisibilityState());
  }
  void changePasswordVisibilityConfirm() {
    obscureTextConfirm = !obscureTextConfirm;
    suffixConfirm = obscureTextConfirm ? FontAwesomeIcons.eyeLowVision : FontAwesomeIcons.eye;
    emit(ChangePasswordVisibilityConfirmState());
  }
}
