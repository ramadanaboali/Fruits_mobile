// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

AddressModel addressModelFromJson(String str) => AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  AddressModel({
    this.addressDetail,
    this.status,
    this.message,
  });

  List<AddressDetail> addressDetail;
  int status;
  String message;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    addressDetail: List<AddressDetail>.from(json["AddressDetail"].map((x) => AddressDetail.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "AddressDetail": List<dynamic>.from(addressDetail.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class AddressDetail {
  AddressDetail({
    this.id,
    this.userName,
    this.phone,
    this.longitude,
    this.latitude,
    this.address,
    this.isDefault,
    this.isDeleted,
    this.userId,
  });

  String id;
  String userName;
  String phone;
  String longitude;
  String latitude;
  String address;
  bool isDefault;
  bool isDeleted;
  String userId;

  factory AddressDetail.fromJson(Map<String, dynamic> json) => AddressDetail(
    id: json["id"],
    userName: json["userName"],
    phone: json["phone"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    address: json["address"],
    isDefault: json["isDefault"],
    isDeleted: json["isDeleted"],
    userId: json["userId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "phone": phone,
    "longitude": longitude,
    "latitude": latitude,
    "address": address,
    "isDefault": isDefault,
    "isDeleted": isDeleted,
    "userId": userId,
  };
}
