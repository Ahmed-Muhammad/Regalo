class SendCodeToPhone {
  SendCodeToPhone({required this.message, required this.data});

  bool message;
  String data;

  factory SendCodeToPhone.fromJson(dynamic json) {
    return SendCodeToPhone(
      message: json['message'],
      data: json['data'],
    );
  }
}

class VerifyCode {
  VerifyCode({required this.message, required this.data});

  bool? message;
  String? data;

  factory VerifyCode.fromJson(Map<dynamic, dynamic> json) {
    return VerifyCode(
      message: json['message'],
      data: json['data'],
    );
  }
}

class ChangePassword {
  ChangePassword({required this.message, required this.data});

  bool? message;
  String? data;

  factory ChangePassword.fromJson(Map<dynamic, dynamic> json) {
    return ChangePassword(
      message: json['message'],
      data: json['data'],
    );
  }
}
