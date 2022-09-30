import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regalo/src/core/api/dio_helper.dart';
import 'package:regalo/src/core/shared/components.dart';
import 'package:regalo/src/features/restore_password/widgets/change_password.dart';

import '../../../../core/notifications/local_notification.dart';
import '../../../../models/restore_password_model.dart';
import '../../widgets/verify_code_page.dart';
import 'restore_password_state.dart';

class RestorePasswordCubit extends Cubit<RestorePasswordState> {
  RestorePasswordCubit() : super(RestorePasswordInitial());

  static RestorePasswordCubit get(context) => BlocProvider.of(context);

  void sendCodeToPhoneByLocalNotification({required String phone, context, bool? navigate}) {
    DioHelper.postData(
      url: 'forgetpassword',
      data: {
        'phone': phone,
      },
    ).then(
      (value) {
        SendCodeToPhone sentCode = SendCodeToPhone.fromJson(value?.data);
        LocalNotification.showNotification(
          body: sentCode.data.toString(),
          title: 'regalo Verification Code',
        );
        print(value?.data);
        print(sentCode.data.toString());
        navigateToPage(context, pageName: VerifyCodePage(apiCode: sentCode.data.toString()));
        emit(SendCodeToPhoneByLocalNotificationLoadingState());

      },
    ).catchError(
      (error) {
        emit(SendCodeToPhoneByLocalNotificationErrorState());
        print('Error in send Code To Phone ===> ${error.toString()}');
        emit(VerifyCodeErrorState());
      },
    );
  }

  void changePassword() {}
}
