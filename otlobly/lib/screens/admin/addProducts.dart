import 'package:flutter/material.dart';
import 'package:otlobly/models/product.dart';
import 'package:otlobly/screens/home/homeAdmin.dart';
import 'package:otlobly/screens/wrapper.dart';
import 'package:otlobly/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:otlobly/services/store.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final AuthService _auth = AuthService();
  final _store=Store();
  final _formKey = GlobalKey<FormState>();

  String error = '';
  // Text Field state
  String productName = '';
  String productPrice = '';
  String productDescription = '';
  String productCategory = '';
  String productLocation = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add product'),
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
                  decoration: InputDecoration(hintText: 'Product Description'),
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
                TextFormField(
                  decoration: InputDecoration(hintText: 'Product Category'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return ('Enter a product category');
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      productCategory = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Product Location'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return ('Enter a product location');
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      productLocation = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _store.addProduct(Product(
                        pName: productName,
                        pPrice: productPrice,
                        pCategory: productCategory,
                        pDescription: productDescription,
                        pLocation: productLocation
                      ));
                       Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeAdmin()));
              
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
  }
}
