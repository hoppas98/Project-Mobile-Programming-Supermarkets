import 'package:flutter/material.dart';
import 'package:otlobly/models/product.dart';
import 'package:otlobly/screens/home/home_admin.dart';
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

  @override
  Widget build(BuildContext context) {
    String supermarketName = ModalRoute.of(context).settings.arguments;
    print(supermarketName);
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Supermarket Name',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Text(supermarketName,
                    style:
                        TextStyle(fontSize: 25, fontStyle: FontStyle.italic)),
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
                SizedBox(
                  height: 10.0,
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
                          pLocation: productLocation,
                          pFromSupermarket: supermarketName));
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
