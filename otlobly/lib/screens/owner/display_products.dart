import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:otlobly/models/product.dart';
import 'package:otlobly/services/store.dart';

class ViewProducts extends StatefulWidget {
  @override
  _ViewProductsState createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          backgroundColor: Colors.red,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _store.loadProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Product> products = [];
                for (var doc in snapshot.data.documents) {
                  var data = doc.data;

                  products.add(Product(
                    pId: doc.documentID,
                    pName: data['productName'],
                    pPrice: data['productPrice'],
                    pDescription: data['productDescription'],
                    pLocation: data['productLocation'],
                    pCategory: data['productCategory'],
                  ));
                }
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: Stack(children: [
                              Positioned.fill(
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage(products[index].pLocation),
                                ),
                              ),
                              Positioned(
                                  bottom: 0,
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: Opacity(
                                    opacity: 0.5,
                                    child: Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              products[index].pName,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text('EGP ' +
                                                products[index].pPrice),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))
                            ]),
                          ),
                        ),
                    itemCount: products.length);
              } else {
                return Center(child: Text('Loading'));
              }
            }));
  }
}
