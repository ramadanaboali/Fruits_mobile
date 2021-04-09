// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.productDetail,
    this.status,
    this.message,
  });

  List<ProductDetail> productDetail;
  int status;
  String message;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    productDetail: List<ProductDetail>.from(json["ProductDetail"].map((x) => ProductDetail.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "ProductDetail": List<dynamic>.from(productDetail.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class ProductDetail {
  ProductDetail({
    this.id,
    this.name,
    this.description,
    this.coverPhoto,
    this.price,
    this.counter,
    this.disCount,
    this.offerPrice,
  });

  String id;
  String name;
  String description;
  String coverPhoto;
  int price;
  int counter;
  int disCount;
  int offerPrice;

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    coverPhoto: json["coverPhoto"],
    price: json["price"],
    counter: json["counter"],
    disCount: json["disCount"],
    offerPrice: json["offerPrice"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "coverPhoto": coverPhoto,
    "price": price,
    "counter": counter,
    "disCount": disCount,
    "offerPrice": offerPrice,
  };
}
