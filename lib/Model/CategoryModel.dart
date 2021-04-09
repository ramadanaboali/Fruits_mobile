// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';
CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));
String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());
class CategoryModel {
  CategoryModel({
    this.categoryModelDetail,
    this.status,
    this.message,
  });

  List<CategoryModelDetail> categoryModelDetail;
  int status;
  String message;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    categoryModelDetail: List<CategoryModelDetail>.from(json["CategoryModelDetail"].map((x) => CategoryModelDetail.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "CategoryModelDetail": List<dynamic>.from(categoryModelDetail.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class CategoryModelDetail {
  CategoryModelDetail({
    this.id,
    this.name,
    this.photo,
  });

  String id;
  String name;
  String photo;

  factory CategoryModelDetail.fromJson(Map<String, dynamic> json) => CategoryModelDetail(
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
