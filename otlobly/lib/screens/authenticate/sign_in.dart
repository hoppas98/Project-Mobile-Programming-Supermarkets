import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:otlobly/screens/authenticate/register.dart';
import 'package:flutter/material.dart';
import 'package:otlobly/screens/home/home_admin.dart';
import 'package:otlobly/screens/home/home_default.dart';
import 'package:otlobly/screens/home/home_owner.dart';
import 'package:otlobly/services/auth.dart';
import 'package:otlobly/services/store.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  var usersRef = Firestore.instance.collection('Users');
  var foundType;
  String error = '';
  // Text Field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('Sign in'),
        actions: [
          FlatButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Register();
                  }),
                );
              },
              icon: Icon(Icons.person, color: Colors.white),
              label: Text('Register', style: TextStyle(color: Colors.white)))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
                    return ('Enter a password 6+ chars long');
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
              RaisedButton(
                onPressed: () async {
                  usersRef
                      .where('UserEmail', isEqualTo: email)
                      .getDocuments()
                      .then((QuerySnapshot snapshot) {
                    snapshot.documents.forEach((DocumentSnapshot doc) {
                      print("Here ${doc.data['UserType']}");
                      foundType = doc.data['UserType'];
                      print("Here ${foundType}");
                    });
                  });

                  if (_formKey.currentState.validate()) {
                    dynamic result =
                        await _auth.signInWithEmailAndPassword(email, password);

                    if (result == null) {
                      setState(() {
                        error = 'Enter a valid Email and Password';
                      });
                    } else {
                      if (foundType == 'Admin') {
                        usersRef = await Firestore.instance.collection('Users');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeAdmin()));
                      } else if (foundType == 'Client') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeDefault()));
                      } else if (foundType == 'Owner') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeOwner()));
                      }
                      // Navigator.pushNamed(
                      //   context,
                      //   '/wrapper',
                      //   arguments: email,
                      // );
                    }
                  }
                },
                color: Colors.redAccent,
                child: Text(
                  'Sign in',
                  style: TextStyle(),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0)),
              MaterialButton(
                onPressed: () {
                  return null;
                },
                color: Colors.white,
                textColor: Colors.black,
                child: Text('Login with Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
