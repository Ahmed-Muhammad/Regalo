import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:regalo/src/core/api/end_points.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:regalo/src/models/login_model.dart';
import 'package:regalo/src/models/products_model.dart';

import '../../../../core/api/dio_helper.dart';
import '../../../../models/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) {
    return BlocProvider.of(context);
  }

//---------------Change Password Visibility -------------------
  IconData suffix = FontAwesomeIcons.eyeLowVision;

  bool obscureText = true;

  void changePasswordVisibility() {
    obscureText = !obscureText;
    suffix = obscureText ? FontAwesomeIcons.eyeLowVision : FontAwesomeIcons.eye;
    emit(ChangePasswordVisibilityState());
  }

//--------------------------------------------------------------
// --------------------------Login------------------------------

  LoginModel? loginModel;

  void userLogin({required String userName, required String password}) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: 'login', //end point
      data: {
        'name': userName,
        'password': password,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value?.data);
      print(value?.data);
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginErrorState());
      print('error in Login  =======> , ${error.toString()}');
    });
  }


// login({
//   required String userName,
//   required String password,
// }) async {
//   emit(LoginLoadingState());
//
//   var baseUrl = Uri.parse('https://eltamiuz.net/regalo/api/login');
//   http.Response response = await http.post(
//     baseUrl,
//     body: {
//       'name': userName,
//       'password': password,
//     },
//   );
//
//   if (response.statusCode == 200) {
//     String responseBody = response.body;
//     emit(LoginSuccessState());
//     return loginModelFromJson(responseBody);
//   } else {
//     return null;
//   }
// }
}
