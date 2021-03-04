import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:otlobly/models/product.dart';
import 'package:otlobly/services/store.dart';

class ManageProduct extends StatefulWidget {
  @override
  _ManageProductState createState() => _ManageProductState();
}

class _ManageProductState extends State<ManageProduct> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    String supermarketName = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit & Delete Products'),
          backgroundColor: Colors.red,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _store.loadProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Product> products = [];
                for (var doc in snapshot.data.documents) {
                  var data = doc.data;
                  if (data['productFromSuperMarket'] == supermarketName) {
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
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTapUp: (details) {
                              double dx = details.globalPosition.dx;
                              double dy = details.globalPosition.dy;
                              double dx2 = MediaQuery.of(context).size.width;
                              double dy2 = MediaQuery.of(context).size.height;
                              showMenu(
                                  context: context,
                                  position:
                                      RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                                  items: [
                                    MyPopupMenuItem(
                                      child: Text('Edit'),
                                      onClick: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/editPage',
                                          arguments: products[index],
                                        );
                                      },
                                    ),
                                    MyPopupMenuItem(
                                      child: Text('Delete'),
                                      onClick: () {
                                        print('Product deleted');
                                        _store
                                            .deleteproduct(products[index].pId);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ]);
                            },
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

class MyPopupMenuItem<T> extends PopupMenuItem<T> {
  final Widget child;
  final Function onClick;
  MyPopupMenuItem({@required this.child, @required this.onClick})
      : super(child: child);
  PopupMenuItemState<T, PopupMenuItem<T>> createState() =>
      MyPopupMenuItemState();
}

class MyPopupMenuItemState<T, PopupMenuItem>
    extends PopupMenuItemState<T, MyPopupMenuItem<T>> {
  void handleTap() {
    widget.onClick();
  }
}

// void initState() {
//   getProducts();
// }

// void getProducts() async {
//   _products = await _store.loadProducts();
// }
