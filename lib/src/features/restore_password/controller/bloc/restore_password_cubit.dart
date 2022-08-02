import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mercado/src/core/api/dio_helper.dart';

import '../../../../core/notifications/local_notification.dart';
import '../../../../models/restore_password_model.dart';
import 'restore_password_state.dart';

class RestorePasswordCubit extends Cubit<RestorePasswordState> {
  RestorePasswordCubit() : super(RestorePasswordInitial());

  static RestorePasswordCubit get(context) => BlocProvider.of(context);

  SendCodeToPhone? sendCodeToPhone;

  void sendCodeToPhoneByLocalNotification({required String phone}) {
    DioHelper.postData(
      url: 'forgetpassword',
      data: {
        'phone': phone,
      },
    ).then((value) {
      SendCodeToPhone code = SendCodeToPhone.fromJson(value?.data);
      LocalNotification.showNotification(
        body: code.data.toString(),
        title:'Mercado Verification Code',
      );

      print(value?.data);
      print(code.data.toString());
      emit(SendCodeToPhoneByLocalNotificationSuccessState());
    }).catchError((error) {
      emit(SendCodeToPhoneByLocalNotificationErrorState());
      print('Error in send Code To Phone ===> ${error.toString()}');
    });
  }

  void verifyCode() {}

  void changePassword() {}
}
