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
  final _formKey = GlobalKey<FormState>();
  final _store = Store();

  // Text Field state
  String email = '';
  String password = '';
  String type = 'Client';
  String name = '';
  String address = '';
  String mobile = '';

  String error = '';

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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Name'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter a Name';
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
                      if (value.isEmpty) {
                        return 'Enter an email';
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
                        return 'Enter a password 6+ chars long';
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Address'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter an address';
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
                    decoration: InputDecoration(hintText: 'Mobile Number'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter a mobile phone';
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
                        _store.addUser(User(
                          uName: name,
                          uEmail: email,
                          uPassword: password,
                          uType: type,
                          uAddress: address,
                          uMobile: mobile,
                        ));

                        if (result == null) {
                          setState(() {
                            error = 'Please supply a valid email';
                          });
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                if (type == 'Client') {
                                  return HomeDefault();
                                } else {
                                  return Wrapper();
                                }
                              },
                            ),
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
          ),
        ],
      ),
    );
  }
}
