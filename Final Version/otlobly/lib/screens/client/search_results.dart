import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otlobly/models/product.dart';
import 'package:otlobly/services/store.dart';

class SeachResult extends StatefulWidget {
  @override
  _SeachResultState createState() => _SeachResultState();
}

class _SeachResultState extends State<SeachResult> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    String searchProduct = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Results for "$searchProduct"'),
          backgroundColor: Colors.red,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _store.loadProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Product> products = [];
                for (var doc in snapshot.data.documents) {
                  var data = doc.data;
                  var temp = data['productName'];
                  if (searchProduct.contains(temp)) {
                    products.add(Product(
                      pId: doc.documentID,
                      pName: data['productName'],
                      pPrice: data['productPrice'],
                      pDescription: data['productDescription'],
                      pLocation: data['productLocation'],
                      pCategory: data['productCategory'],
                      pFromSupermarket: data['productFromSuperMarket'],
                    ));
                  }
                }
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(16.0),
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
                                  height: 75,
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
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'EGP ',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(products[index].pPrice),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Market: ',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(products[index]
                                                    .pFromSupermarket),
                                              ],
                                            ),
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
