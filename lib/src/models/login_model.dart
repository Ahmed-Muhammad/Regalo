class LoginModel {
  LoginModel({required this.message, required this.data});

  bool? message;
  Data? data;

  factory LoginModel.fromJson(Map<dynamic, dynamic> json) {
    return LoginModel(
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}
class Data {
  Data({
    required this.id,
    required this.name,
    required this.phone,
    required this.firebaseToken,
    required this.forgetCode,
  });
  int? id;
  String? name;
  String? phone;
  String? firebaseToken;
  String? forgetCode;
  factory Data.fromJson(dynamic json) {
    return Data(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        firebaseToken: json['firebase_token'],
        forgetCode: json['forgetcode']);
  }
}
