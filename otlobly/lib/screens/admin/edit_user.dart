import 'package:flutter/material.dart';
import 'package:otlobly/models/user.dart';
import 'package:otlobly/screens/home/home_admin.dart';
import 'package:otlobly/services/auth.dart';
import 'package:otlobly/services/store.dart';

class EditUser extends StatefulWidget {
  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final AuthService _auth = AuthService();
  final _store = Store();
  final _formKey = GlobalKey<FormState>();

  String error = '';

  @override
  Widget build(BuildContext context) {
    User users = ModalRoute.of(context).settings.arguments;

    final nameController = TextEditingController(text: users.uName);
    final emailController = TextEditingController(text: users.uEmail);
    final passwordController = TextEditingController(text: users.uPassword);
    final addressController = TextEditingController(text: users.uAddress);
    final typeController = TextEditingController(text: users.uType);
    final mobileController = TextEditingController(text: users.uMobile);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User'),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Email: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${users.uEmail}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'UserID: ',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${users.uid}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return ('Enter the new user name');
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: addressController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return ('Enter the new address');
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return ('Enter the new user type');
                    } else {
                      return null;
                    }
                  },
                  controller: typeController,
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return ('Enter the new user mobile');
                    } else {
                      return null;
                    }
                  },
                  controller: mobileController,
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
                          MaterialPageRoute(builder: (context) => HomeAdmin()));
                      _store.editUser(
                          ({
                            'UserName': nameController.text,
                            'UserEmail': emailController.text,
                            'UserPassword': passwordController.text,
                            'UserType': typeController.text,
                            'UserAddress': addressController.text,
                            'UserMobile': mobileController.text,
                          }),
                          users.uid);
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
