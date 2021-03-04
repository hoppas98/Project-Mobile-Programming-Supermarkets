import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String pName;
  String pPrice;
  String pLocation;
  String pDescription;
  String pCategory;
  String pId;
  String pFromSupermarket;
  bool isFavorite;

  Product(
      {this.pId,
      this.pName,
      this.pPrice,
      this.pLocation,
      this.pDescription,
      this.pCategory,
      this.pFromSupermarket,
      this.isFavorite = false});

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
