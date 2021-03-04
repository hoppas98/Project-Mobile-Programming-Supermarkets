import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:otlobly/screens/authenticate/register.dart';
import 'package:flutter/material.dart';
import 'package:otlobly/screens/home/home_admin.dart';
import 'package:otlobly/screens/home/home_default.dart';
import 'package:otlobly/screens/home/home_owner.dart';
import 'package:otlobly/services/auth.dart';
import 'package:otlobly/services/store.dart';

class UpdatePassword extends StatefulWidget{
  @override
  _UpdatePasswordState createState()=> _UpdatePasswordState();
}
class _UpdatePasswordState extends State<UpdatePassword>{
  
  final usersRef = Firestore().collection('Users');
  final AuthService _auth = AuthService();
  var _formkey=GlobalKey<FormState>();
  final _store = Store();

  String currentPassword = '';
  String newPassword = '';
  String confirmPassword = '';
  var _newPasswordController=TextEditingController();

  @override
  Widget build(BuildContext context){
    Map userData = ModalRoute.of(context).settings.arguments;
    Map userData_2;
    print('userdata_2 $userData_2');
    print('userdataa: $userData');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Update Password",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    labelText: "Current Password",
                    labelStyle: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  obscureText: true,
                  //controller: _passwordController,
                  validator: (value){
                    if(value.isEmpty){
                      return "Enter your current password";
                    }
                     else if (currentPassword!=userData["userPassword"]){
                      return "This is a wrong Password";
                    } 
                    else{
                      return null;
                    }
                  },
                  onChanged: (value){
                    setState(() {
                      currentPassword=value;  
                    });
                   },
                ),
                Padding(
                  padding: EdgeInsets.only(top:20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    labelText: "New Password",
                    labelStyle: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  obscureText: true,
                  controller: _newPasswordController,
                  validator: (value){
                    if(value.isEmpty){
                      return "Enter your new password";
                    }else if (value.length < 6) {
                        return 'Enter a password 6 or more chars long';
                      } else {
                        return null;
                      }
                  },
                   onChanged: (value){
                    setState(() {
                      newPassword=value;  
                    });
                   },
                   ),
                  ),
                  Padding(
                  padding: EdgeInsets.only(top:20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                    focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    labelText: "Confirm new Password",
                    labelStyle: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  obscureText: true,
                  //controller: _repeatPasswordController,
                  validator: (value){
                    if(value.isEmpty){
                      return "Re-enter your new password";
                    }
                       else if (confirmPassword != newPassword) {
                        return "Password doesn't match";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        confirmPassword = value;
                      });
                    
                  },
                  // validator: (value){
                  //   if(confirmPassword!=newPassword){
                  //     return "Password doesn't match";
                  //   }else {
                  //       return null;
                  //     }
                  // },
                  // onSaved: (value){
                  //   confirmPassword=value;
                  // },
                  // onChanged: (value) {
                  //     setState(() {
                  //       _repeatPasswordController = value;
                  //     });
                  //   },
                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top:20.0),
                    child: RaisedButton(
                      onPressed: () async {
                        if(_formkey.currentState.validate()){
                          dynamic result = await _auth.changePassword(newPassword);
                          
                           Navigator.pop(context);
                           _store.editUser(
                          ({
                             'UserPassword': _newPasswordController.text,
                          }),
                          userData['userID']);
                    } else {
                      print('Error');
                    }
                        },
                      
                      child: Text(
                        "Save Changes",
                         style: TextStyle(
                           color: Colors.red,
                         ),
                         ),
                      ),
                    ),
              ],
            ),
          ),
        ),
        ),
    );
  }
}