import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:otlobly/models/product.dart';
import 'package:otlobly/screens/home/home_admin.dart';
import 'package:otlobly/screens/home/home_owner.dart';
import 'package:otlobly/screens/owner/display_products.dart';
import 'package:otlobly/screens/owner/manage_product.dart';
import 'package:otlobly/services/auth.dart';
import 'package:otlobly/services/store.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final AuthService _auth = AuthService();
  final _store = Store();
  final _formKey = GlobalKey<FormState>();

  String error = '';
  // Text Field state
  String productName = '';
  String productPrice = '';
  String productDescription = '';
  String productCategory = '';
  String productLocation = '';
  String productFrom = '';
  String dropdownValueCategory = 'Sweet';
  String dropdownValueLocation;
  List<String> productsLocation = [];
  @override
  Widget build(BuildContext context) {
    Map userData = ModalRoute.of(context).settings.arguments;
    print(userData['userSuperMarketName']);
    return StreamBuilder<QuerySnapshot>(
        stream: _store.loadProductsLocation(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            productsLocation.clear();
            for (var doc in snapshot.data.documents) {
              var data = doc.data['ProductLocation'];
              productsLocation.add(data);

              print('$productsLocation');
            }
          }

          return Scaffold(
            appBar: AppBar(
              title: Text('Add Product'),
              backgroundColor: Colors.red,
              actions: [
                FlatButton.icon(
                  onPressed: () async {
                    await _auth.signOut();
                  },
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: Text('Logout',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                )
              ],
            ),
            body: ListView(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        "PRODUCT INFO.",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Supermarket Name',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      Text(userData['userSuperMarketName'],
                          style: TextStyle(
                              fontSize: 25, fontStyle: FontStyle.italic)),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Product Name'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return ('Enter a product name');
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            productName = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Product Price'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return ('Enter a product price');
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            productPrice = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: 'Product Description'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return null;
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            productDescription = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Category'),
                          DropdownButton<String>(
                            value: dropdownValueCategory,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.black),
                            underline: Container(
                              height: 2,
                              color: Colors.red,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValueCategory = newValue;
                              });
                            },
                            items: <String>['Sweet', 'Beverage', 'Fruits']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Image Location'),
                          DropdownButton<String>(
                            value: dropdownValueLocation,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.black),
                            underline: Container(
                              height: 2,
                              color: Colors.red,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValueLocation = newValue;
                              });
                            },
                            items: productsLocation
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _store.addProduct(Product(
                                pName: productName,
                                pPrice: productPrice,
                                pCategory: productCategory,
                                pDescription: productDescription,
                                pLocation: dropdownValueLocation,
                                pFromSupermarket:
                                    userData['userSuperMarketName']));
                            Navigator.pushNamed(
                              context,
                              '/homeOwner',
                              arguments: userData,
                            );
                          } else {
                            print('Error');
                          }
                        },
                        child: Text('Add'),
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
