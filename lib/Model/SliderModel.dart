// To parse this JSON data, do
//
//     final sliderModel = sliderModelFromJson(jsonString);

import 'dart:convert';

SliderModel sliderModelFromJson(String str) => SliderModel.fromJson(json.decode(str));

String sliderModelToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
  SliderModel({
    this.sliderModelDetail,
    this.status,
    this.message,
  });

  List<SliderModelDetail> sliderModelDetail;
  int status;
  String message;

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
    sliderModelDetail: List<SliderModelDetail>.from(json["SliderModelDetail"].map((x) => SliderModelDetail.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "SliderModelDetail": List<dynamic>.from(sliderModelDetail.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class SliderModelDetail {
  SliderModelDetail({
    this.id,
    this.title,
    this.description,
    this.photo,
  });

  String id;
  String title;
  String description;
  String photo;

  factory SliderModelDetail.fromJson(Map<String, dynamic> json) => SliderModelDetail(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "photo": photo,
  };
}
