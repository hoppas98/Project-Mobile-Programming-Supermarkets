import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:otlobly/models/product.dart';
import 'package:otlobly/models/user.dart';

class Store {
  final Firestore _firestore = Firestore.instance;

  // Product's functions
  addProduct(Product product) {
    _firestore.collection('Product').add({
      'productName': product.pName,
      'productPrice': product.pPrice,
      'productDescription': product.pDescription,
      'productLocation': 'images/' + product.pLocation,
      'productCategory': product.pCategory,
      'productFromSuperMarket': product.pFromSupermarket,
    });
  }

  Stream<QuerySnapshot> loadProducts() {
    return _firestore.collection('Product').orderBy('productName').snapshots();
  }

  Stream<QuerySnapshot> loadProductsLocation() {
    return _firestore.collection('ProductLocation').snapshots();
  }

  deleteproduct(documentID) {
    _firestore.collection('Product').document(documentID).delete();
  }

  editProduct(data, documentID) {
    _firestore.collection('Product').document(documentID).updateData(data);
  }

  // Order's functions
  Stream<QuerySnapshot> loadOrders() {
    return _firestore.collection('Orders').snapshots();
  }

  deleteOrder(documentID) {
    _firestore.collection('Orders').document(documentID).delete();
    print('deleted');
  }

// User's functions
  addUser(User user) {
    _firestore.collection('Users').add({
      'UserName': user.uName,
      'UserEmail': user.uEmail,
      'UserPassword': user.uPassword,
      'UserType': user.uType,
      'UserAddress': user.uAddress,
      'UserMobile': user.uMobile,
      'UserSuperMarketName': user.uSuperMarketName,
    });
  }

  Stream<QuerySnapshot> loadUsers() {
    return _firestore.collection('Users').orderBy('UserType').snapshots();
  }

  deleteUser(documentID) {
    _firestore.collection('Users').document(documentID).delete();
  }

  editUser(data, documentID) {
    _firestore.collection('Users').document(documentID).updateData(data);
  }
}
