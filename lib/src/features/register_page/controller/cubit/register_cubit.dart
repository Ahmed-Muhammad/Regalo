import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:regalo/src/core/api/dio_helper.dart';
import 'package:regalo/src/models/register_model.dart';

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

  //Register -----------------------------------------
  RegisterModel? registerModel;

  registerUser({
    required String name,
    required String phone,
    required String password,
     dynamic firebaseToken,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: 'register',
      data: {
        'name': name,
        'phone': phone,
        'password': password,
        // 'firebase_token': firebaseToken,
      },
    ).then((value) {
      registerModel = RegisterModel.fromJson(value?.data);
      print(value?.data);
      emit(RegisterSuccessState());
    }).catchError((error) {
      emit(RegisterErrorState());
      print('error in Register =======> ${error.toString()}');
    });
  }
}
