// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) => SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  SearchModel({
    this.productSearch,
    this.categorySearch,
    this.status,
    this.message,
  });

  List<ProductSearch> productSearch;
  List<CategorySearch> categorySearch;
  int status;
  String message;

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    productSearch: List<ProductSearch>.from(json["ProductSearch"].map((x) => ProductSearch.fromJson(x))),
    categorySearch: List<CategorySearch>.from(json["CategorySearch"].map((x) => CategorySearch.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "ProductSearch": List<dynamic>.from(productSearch.map((x) => x.toJson())),
    "CategorySearch": List<dynamic>.from(categorySearch.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class CategorySearch {
  CategorySearch({
    this.id,
    this.name,
    this.photo,
  });

  String id;
  String name;
  String photo;

  factory CategorySearch.fromJson(Map<String, dynamic> json) => CategorySearch(
    id: json["id"],
    name: json["name"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "photo": photo,
  };
}

class ProductSearch {
  ProductSearch({
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

  factory ProductSearch.fromJson(Map<String, dynamic> json) => ProductSearch(
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
