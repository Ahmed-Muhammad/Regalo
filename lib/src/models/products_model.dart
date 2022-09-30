class ProductsModel {
  bool? message;
  List<Data>? data;

  ProductsModel.fromJson(dynamic json) {
    message = json['message'];

    data = json['data'].forEach((v) => data?.add(Data.fromJson(v)));
  }
}

class Data {
  int? id;
  Image? image;
  String? title;
  String? type;
  int? price;

  Data.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    title = json['title'];
    type = json['type'];
    price = json['price'];
  }
}

class Image {
  int? imageId;
  int? itemId;
  String? image;

  Image.fromJson(dynamic json) {
    imageId = json['id'];
    itemId = json['item_id'];
    image = json['image'];
  }
}
