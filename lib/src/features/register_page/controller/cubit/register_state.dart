abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class ChangePasswordVisibilityState extends RegisterState {}

class ChangePasswordVisibilityConfirmState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterErrorState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}
