import 'package:flutter/material.dart';
import 'package:otlobly/models/product.dart';
import 'package:otlobly/screens/home/home_admin.dart';
import 'package:otlobly/screens/home/home_owner.dart';
import 'package:otlobly/screens/owner/manage_product.dart';
import 'package:otlobly/screens/wrapper.dart';
import 'package:otlobly/services/auth.dart';
import 'package:otlobly/services/store.dart';

class EditProduct extends StatefulWidget {
  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final AuthService _auth = AuthService();
  final _store = Store();
  final _formKey = GlobalKey<FormState>();

  String error = '';

  @override
  Widget build(BuildContext context) {
    Product products = ModalRoute.of(context).settings.arguments;

    final nameController = TextEditingController(text: products.pName);
    final priceController = TextEditingController(text: products.pPrice);
    final descriptionController =
        TextEditingController(text: products.pDescription);
    final categoryController = TextEditingController(text: products.pCategory);
    final locationController = TextEditingController(text: products.pLocation);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit product'),
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
                  controller: nameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return ('Enter the new product name');
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: priceController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return ('Enter the new product price');
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: descriptionController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return null;
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: categoryController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return ('Enter the new product category');
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return ('Enter the new product location');
                    } else {
                      return null;
                    }
                  },
                  controller: locationController,
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeOwner()));
                      _store.editProduct(
                          ({
                            'productName': nameController.text,
                            'productPrice': priceController.text,
                            'productDescription': descriptionController.text,
                            'productLocation': locationController.text,
                            'productCategory': categoryController.text,
                          }),
                          products.pId);
                    } else {
                      print('Error');
                    }
                  },
                  child: Text('SAVE CHANGES'),
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
