// To parse this JSON data, do
//
//     final paymentModel = paymentModelFromJson(jsonString);

import 'dart:convert';

PaymentModel paymentModelFromJson(String str) => PaymentModel.fromJson(json.decode(str));

String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());

class PaymentModel {
  PaymentModel({
    this.paymentDetail,
    this.status,
    this.message,
  });

  List<PaymentDetail> paymentDetail;
  int status;
  String message;

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
    paymentDetail: List<PaymentDetail>.from(json["PaymentDetail"].map((x) => PaymentDetail.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "PaymentDetail": List<dynamic>.from(paymentDetail.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class PaymentDetail {
  PaymentDetail({
    this.id,
    this.name,
    this.isDeleted,
    this.createdAt,
    this.lastModified,
  });

  String id;
  String name;
  bool isDeleted;
  DateTime createdAt;
  DateTime lastModified;

  factory PaymentDetail.fromJson(Map<String, dynamic> json) => PaymentDetail(
    id: json["id"],
    name: json["name"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    lastModified: DateTime.parse(json["lastModified"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "lastModified": lastModified.toIso8601String(),
  };
}
