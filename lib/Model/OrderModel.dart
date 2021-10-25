// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.orderDetail,
    this.status,
    this.message,
  });

  List<OrderDetail> orderDetail;
  int status;
  String message;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    orderDetail: List<OrderDetail>.from(json["OrderDetail"].map((x) => OrderDetail.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "OrderDetail": List<dynamic>.from(orderDetail.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class OrderDetail {
  OrderDetail({
    this.id,
    this.userName,
    this.orderDate,
    this.totalPrice,
    this.orderStatus,
    this.orderItems,
  });

  String id;
  String userName;
  DateTime orderDate;
  int totalPrice;
  String orderStatus;
  List<OrderItem> orderItems;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
    id: json["id"],
    userName: json["userName"],
    orderDate: DateTime.parse(json["orderDate"]),
    totalPrice: json["totalPrice"],
    orderStatus: json["orderStatus"],
    orderItems: List<OrderItem>.from(json["orderItems"].map((x) => OrderItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userName": userName,
    "orderDate": orderDate.toIso8601String(),
    "totalPrice": totalPrice,
    "orderStatus": orderStatus,
    "orderItems": List<dynamic>.from(orderItems.map((x) => x.toJson())),
  };
}

class OrderItem {
  OrderItem({
    this.id,
    this.productName,
    this.productPrice,
    this.orderItemStatus,
    this.productCoverPhoto,
    this.quantity,
    this.price,
  });

  String id;
  String productName;
  int productPrice;
  String orderItemStatus;
  String productCoverPhoto;
  int quantity;
  int price;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    id: json["id"],
    productName: json["productName"],
    productPrice: json["productPrice"],
    orderItemStatus: json["orderItemStatus"],
    productCoverPhoto: json["productCoverPhoto"],
    quantity: json["quantity"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productName": productName,
    "productPrice": productPrice,
    "orderItemStatus": orderItemStatus,
    "productCoverPhoto": productCoverPhoto,
    "quantity": quantity,
    "price": price,
  };
}
