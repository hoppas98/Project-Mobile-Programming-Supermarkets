import 'package:cloud_firestore/cloud_firestore.dart';

class Order {
  String userEmail;
  String userName;
  String userMobile;
  String userOrder;
  String userLocation;
  String totalPrice;
  String orderID;
  String createdAt;

  Order({
    this.userEmail,
    this.userName,
    this.userMobile,
    this.userOrder,
    this.userLocation,
    this.totalPrice,
    this.orderID,
    this.createdAt,
  });
}
