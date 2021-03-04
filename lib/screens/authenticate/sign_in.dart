import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:otlobly/screens/authenticate/register.dart';
import 'package:flutter/material.dart';
import 'package:otlobly/screens/home/home_admin.dart';
import 'package:otlobly/screens/home/home_default.dart';
import 'package:otlobly/screens/home/home_owner.dart';
import 'package:otlobly/services/auth.dart';

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

  Map userData;

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
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          child: ListView(children: [
            Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Icon(
                        Icons.account_circle_outlined,
                        size: 150,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)),
                            hintText: 'Email'),
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
                        decoration: InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.teal)),
                            hintText: 'Password'),
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
                              userData = {
                                'userID': doc.documentID,
                                'userName': doc.data['UserName'],
                                'userEmail': doc.data['UserEmail'],
                                'userMobile': doc.data['UserMobile'],
                                'userType': doc.data['UserType'],
                                'userAddress': doc.data['UserAddress'],
                                'userSuperMarketName':
                                    doc.data['UserSuperMarketName']
                              };
                              foundType = doc.data['UserType'];
                            });
                          });

                          if (_formKey.currentState.validate()) {
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);

                            if (result == null) {
                              setState(() {
                                error = 'Enter a valid Email and Password';
                              });
                            } else {
                              if (foundType == 'Admin') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeAdmin()));
                              } else if (foundType == 'Client') {
                                Navigator.pushNamed(
                                  context,
                                  '/homeDefault',
                                  arguments: userData,
                                );
                              } else if (foundType == 'Owner') {
                                Navigator.pushNamed(
                                  context,
                                  '/homeOwner',
                                  arguments: userData,
                                );
                              }
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
                      Text(error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0)),
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
              ],
            ),
          ]),
        ),
      ),
    );
  }
  //   void _changePassword(String password) async{
  //  //Create an instance of the current user.
  //   FirebaseUser user = await FirebaseAuth.instance.currentUser();

  //   //Pass in the password to updatePassword.
  //   user.updatePassword(password).then((_){
  //     print("Successfully changed password");
  //   }).catchError((error){
  //     print("Password can't be changed" + error.toString());
  //     //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
  //   });
  // }
}
