import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:otlobly/models/order.dart';
import 'package:otlobly/models/product.dart';
import 'package:otlobly/screens/admin/addProducts.dart';

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
    });
  }

  Stream<QuerySnapshot> loadProducts() {
    return _firestore.collection('Product').snapshots();
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
    print(documentID);
    _firestore.collection('Orders').document(documentID).delete();
    print('deleted');
  }
}
