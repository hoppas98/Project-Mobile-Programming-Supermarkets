import 'package:flutter/material.dart';
import 'package:otlobly/models/product.dart';
import 'package:otlobly/models/user.dart';
import 'package:otlobly/screens/home/home_admin.dart';
import 'package:otlobly/services/auth.dart';
import 'package:otlobly/services/store.dart';

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final AuthService _auth = AuthService();
  final _store = Store();
  final _formKey = GlobalKey<FormState>();

  String error = '';
  // Text Field state
  String userName = '';
  String userEmail = '';
  String userPassword = '';
  String userType = '';
  String userAddress = '';
  String userMobile = '';

  String dropdownValue = 'Admin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
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
                  decoration: InputDecoration(hintText: 'Name'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return ('Fill this');
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      userName = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Email'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return ('Fill this');
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      userEmail = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Password'),
                  validator: (value) {
                    if (value.length < 6) {
                      return 'Your password must be +6 characters';
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      userPassword = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Address'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return ('Fill this');
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      userAddress = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Mobile'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return ('Fill this');
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      userMobile = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                DropdownButton<String>(
                  value: dropdownValue,
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
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['Admin', 'Owner']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
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
                  onPressed: () async {
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        userEmail, userPassword);
                    if (_formKey.currentState.validate()) {
                      _store.addUser(User(
                        uName: userName,
                        uEmail: userEmail,
                        uPassword: userPassword,
                        uType: dropdownValue,
                        uAddress: userAddress,
                        uMobile: userMobile,
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
