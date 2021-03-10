import 'package:cloud_firestore/cloud_firestore.dart';

class OrderItemItem {
  final String userEmail;
  final String orderID;
  final String userMobile;
  final String userOrder;
  final String userLocation;
  final String userName;
  final String totalPrice;
  final String createdAt;

  OrderItemItem(
      {this.userEmail,
      this.orderID,
      this.userMobile,
      this.userOrder,
      this.userLocation,
      this.userName,
      this.totalPrice,
      this.createdAt});
}
