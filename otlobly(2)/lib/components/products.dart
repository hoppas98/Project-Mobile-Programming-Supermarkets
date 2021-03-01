import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:otlobly/models/product.dart';
import 'package:otlobly/pages/product_details.dart';
import 'package:otlobly/screens/owner/manage_product.dart';
import 'package:otlobly/services/store.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final _store = Store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: _store.loadProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Product> productList = [];
                for (var doc in snapshot.data.documents) {
                  var data = doc.data;

                  productList.add(Product(
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
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: Stack(children: [
                        Positioned.fill(
                          child: Image(
                            fit: BoxFit.fill,
                            image: AssetImage(productList[index].pLocation),
                          ),
                        ),
                        InkWell(
                            onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ManageProduct()),
                                  //we're gonna update the navigation here
                                )),
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
                                        productList[index].pName,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('EGP ' + productList[index].pPrice),
                                    ],
                                  ),
                                ),
                              ),
                            ))
                      ]),
                    ),
                  ),
                  itemCount: productList.length,
                );
              }
            }));
  }
}
