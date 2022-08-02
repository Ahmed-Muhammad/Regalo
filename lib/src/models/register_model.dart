class RegisterModel {
  bool message;
  Data data;

  RegisterModel({
    required this.message,
    required this.data,
  });

  factory RegisterModel.fromJson(dynamic json) {
    return RegisterModel(
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  int id;
  String name;
  String phone;
  dynamic firebaseToken ;
  dynamic forgetcode;

  Data({
    required this.id,
    required this.name,
    required this.phone,
    required this.firebaseToken,
    required this.forgetcode,
  });

  factory Data.fromJson(dynamic json) {
    return Data(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      firebaseToken: json['firebase_token'],
      forgetcode: json['forgetcode'],
    );
  }
}
