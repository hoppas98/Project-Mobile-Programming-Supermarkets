import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String uName;
  final String uEmail;
  final String uPassword;
  final String uType;
  final String uAddress;
  final String uMobile;
  final String uSuperMarketName;
  User({
    this.uid,
    this.uName,
    this.uEmail,
    this.uPassword,
    this.uType,
    this.uAddress,
    this.uMobile,
    this.uSuperMarketName,
  });
}
