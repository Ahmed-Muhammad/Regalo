abstract class RestorePasswordState {}

class RestorePasswordInitial extends RestorePasswordState {}


class VerifyCodeSuccessState extends RestorePasswordState {}
class VerifyCodeErrorState extends RestorePasswordState {}

class SendCodeToPhoneByLocalNotificationSuccessState extends RestorePasswordState {}
class SendCodeToPhoneByLocalNotificationErrorState extends RestorePasswordState {}

class ChangePasswordSuccessState extends RestorePasswordState {}
class ChangePasswordErrorState extends RestorePasswordState {}

