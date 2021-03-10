import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:otlobly/models/user.dart';
import 'package:otlobly/screens/home/home_default.dart';
import 'package:otlobly/screens/home/home_owner.dart';
import 'package:otlobly/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:otlobly/services/auth.dart';
import 'package:otlobly/services/store.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  var usersRef = Firestore.instance.collection('Users');

  final _formKey = GlobalKey<FormState>();
  final _store = Store();

  // Text Field state
  String email = '';
  String password = '';
  String confirmPassword = '';
  String type = 'Client';
  String name = '';
  String address = '';
  String mobile = '';

  String error = '';
  bool saveData = true;
  String matchingMessage = '';
  bool matchingDisplay = false;
  Color matchingDisplayColor = const Color(0xFFD50000);
  Map userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('Sign up'),
        actions: [
          FlatButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.person, color: Colors.white),
              label: Text('Sign in', style: TextStyle(color: Colors.white))),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: Column(
              children: [
                Icon(
                  Icons.account_box_outlined,
                  size: 150,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Name'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter your Name e.g. Mohamed Adel';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Email'),
                        validator: (value) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email);

                          if (value.isEmpty) {
                            return 'Enter an email';
                          } else if (emailValid == false) {
                            return "Enter a valid email e.g. Mohamedxxxxxx@gmail.com";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Password'),
                        validator: (value) {
                          if (value.length < 6) {
                            return 'Enter a password 6 or more chars long';
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                          if (password != confirmPassword) {
                            matchingDisplayColor = const Color(0xFFD50000);
                            matchingMessage = "Doesn't match yet";
                          } else if (password == confirmPassword) {
                            matchingDisplayColor = const Color(0xFF1B5E20);
                            matchingMessage = "Matched";
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration:
                            InputDecoration(hintText: 'Confirm Password'),
                        validator: (value) {
                          if (confirmPassword != password) {
                            return "Password doesn't match";
                          } else {
                            return null;
                          }
                        },
                        obscureText: true,
                        onChanged: (value) {
                          setState(() {
                            confirmPassword = value;
                            matchingDisplay = true;
                            if (value.isEmpty) {
                              matchingDisplay = false;
                            }
                          });
                          if (password != confirmPassword) {
                            matchingDisplayColor = const Color(0xFFD50000);
                            matchingMessage = "Doesn't match yet";
                          } else if (password == confirmPassword) {
                            matchingDisplayColor = const Color(0xFF1B5E20);
                            matchingMessage = "Matched";
                          }
                        },
                      ),
                      Visibility(
                        visible: matchingDisplay,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  matchingMessage,
                                  style: TextStyle(color: matchingDisplayColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Address'),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter a location';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            address = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                            hintText: 'Mobile Number e.g. 01xx xxx xx xx'),
                        validator: (value) {
                          if (value.length != 11) {
                            return 'Enter a valid mobile phone';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            mobile = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);

                            if (result == null) {
                              setState(() {
                                error = 'Please supply a valid email';
                              });
                            } else {
                              _store.addUser(User(
                                uName: name,
                                uEmail: email,
                                uPassword: password,
                                uType: type,
                                uAddress: address,
                                uMobile: mobile,
                              ));

                              userData = {
                                'userName': name,
                                'userEmail': email,
                                'userMobile': mobile,
                                'userType': type,
                                'userAddress': address
                              };

                              Navigator.pushNamed(
                                context,
                                '/homeDefault',
                                arguments: userData,
                              );
                            }
                          }
                        },
                        color: Colors.redAccent,
                        child: Text(
                          'Sign up',
                          style: TextStyle(),
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
