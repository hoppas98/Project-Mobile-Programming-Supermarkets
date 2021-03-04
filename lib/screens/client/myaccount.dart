// // import 'dart:html';

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:otlobly/models/user.dart';
// // import 'package:otlobly/screens/client/settings.dart';
// // import 'package:otlobly/screens/home/homepage.dart';
// // import 'package:otlobly/services/auth.dart';
// // import 'package:otlobly/services/store.dart';


// // class SettingUI extends StatelessWidget{
// //   @override
// //   Widget build(BuildContext context){
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title:"Setting UI",
// //       home: EditProfilePage(),
// //     );
// //   }
// // }

// // class EditProfilePage extends StatefulWidget{
// //   @override
// //   _EditProfilePageState createState()=>_EditProfilePageState();
// // }

// // class _EditProfilePageState extends State<EditProfilePage>{
// //   bool showPassword=false;
  
// //   @override
// //   Widget build(BuildContext context){
// //     return Scaffold(
// //       appBar:AppBar(
// //         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
// //         elevation: 1,
// //         leading:IconButton(
// //           icon:Icon(
// //             Icons.arrow_back,
// //             color:Colors.red,
// //           ),
// //           onPressed: (){
// //             Navigator.of(context).pop();
// //           },
// //         ),
// //         actions: [
// //           IconButton(
// //             icon: Icon(
// //               Icons.settings,
// //               color: Colors.red,
// //             ),
// //            onPressed: (){
// //              Navigator.of(context).push(MaterialPageRoute(
// //               builder: (BuildContext context)=>SettingsPage()));
// //            },
// //           ),
// //         ],
// //       ),
// //       body: Container(
// //         padding: EdgeInsets.only(left:16,top:25,right:16),
// //         child: GestureDetector(
// //           onTap: (){
// //             FocusScope.of(context).unfocus();
// //           },
// //                   child: ListView(
// //             children: [
// //               Text("Edit Profile", style:TextStyle(
// //                 fontSize: 30,fontWeight: FontWeight.w500),
// //               ),
// //               Center(
// //                 child: Stack(
// //                   children:[
// //                     Container(
// //                       // width:130,
// //                       // height:130,
// //                       decoration: BoxDecoration(
// //                         border: Border.all(
// //                           width:4,
// //                           color:Theme.of(context).scaffoldBackgroundColor
// //                         ),
// //                         // boxShadow: [
// //                         //   BoxShadow(
// //                         //     spreadRadius: 2,blurRadius: 10,
// //                         //     color:Colors.black.withOpacity(0.1),
// //                         //     offset: Offset(0,10)
// //                         //   )
// //                         // ],
// //                         // shape: BoxShape.circle,
// //                         // image: DecorationImage(
// //                         //   fit: BoxFit.cover,
// //                         //   image: NetworkImage("https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg")
// //                         // )
// //                       ),
// //                     ),
// //                     // Positioned(
// //                     //   // bottom: 0,
// //                     //   // right: 0,
// //                     //   child: Container(
// //                     //     // height: 40,
// //                     //     // width: 40,
// //                     //     // decoration: BoxDecoration(
// //                     //     //   shape: BoxShape.circle,
// //                     //     //   border: Border.all(
// //                     //     //     width: 4,
// //                     //     //     color: Theme.of(context).scaffoldBackgroundColor,
// //                     //     //   ),
// //                     //     //   // color: Colors.red,
// //                     //     // ),
// //                     //     // child: Icon(
// //                     //     //   Icons.edit,
// //                     //     //   color: Colors.white,
// //                     //     // ),
// //                     //   ),
// //                     // )
// //                   ],
// //                 ),
// //               ),
// //               SizedBox(
// //                 height: 35,
// //               ),
// //               buildTextField("Full Name","users",false),
// //               buildTextField("Mobile Number","123",false),
// //               //buildTextField("Password","*****",true),
// //               buildTextField("Address","users",false),
// //               SizedBox(
// //                 height:35,
// //               ),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   OutlineButton(
// //                     padding: EdgeInsets.symmetric(horizontal: 50),
// //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// //                     onPressed: (){
// //                       Navigator.of(context).pop();
// //                     },
// //                     child: Text("CANCEL",
// //                     style: TextStyle(
// //                       fontSize: 14,
// //                       letterSpacing: 2.2,
// //                       color: Colors.red)),                   
// //                     ),
// //                     RaisedButton(
// //                       onPressed: (){},
// //                       color: Colors.red,
// //                       padding: EdgeInsets.symmetric(horizontal: 50),
// //                       elevation: 2,
// //                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
// //                       child: Text(
// //                         "SAVE",
// //                         style: TextStyle(
// //                           fontSize: 14,
// //                           letterSpacing: 2.2,
// //                           color: Colors.white),
// //                       ),
// //                       )
// //                 ],
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // // updateProfileData(){
// // //     setState(() {
// // //       fullNameController.text.trim().length<3 || 
// // //       fullNameController.text.isEmpty ? _fullNameValid= false :
// // //       _fullNameValid=true;
// // //       mobileController.text.trim().length>12 || 
// // //       mobileController.text.isEmpty ? _mobileValid= false :
// // //       _mobileValid=true;
// // //       addressController.text.trim().length<6 || 
// // //       addressController.text.isEmpty ? _addressValid= false :
// // //       _addressValid=true;
// // //     });
// // //     if (_fullNameValid && _mobileValid && _addressValid){
// // //       usersRef.document;
// // //     }
// // //   }
// //   Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField) {
    
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom:35.0),
// //       child: TextField(
// //         obscureText: isPasswordTextField ? showPassword : false,
// //               decoration: InputDecoration(
// //                 suffixIcon: isPasswordTextField ?  IconButton(
// //                   onPressed: (){
// //                     setState(() {
// //                       showPassword =!showPassword;
// //                     });
// //                   },
// //                   icon: Icon(Icons.remove_red_eye,
// //                   color: Colors.grey,
// //                 ),
// //                 ): null,
// //                 contentPadding: EdgeInsets.only(bottom:3),
// //                 labelText: labelText,
// //                 floatingLabelBehavior: FloatingLabelBehavior.always,
// //                 hintText: placeholder,
// //                 hintStyle: TextStyle(
// //                   fontSize: 18, fontWeight: FontWeight.bold,
// //                   color: Colors.red,  
// //                 )
// //               )),
// //             );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:otlobly/models/user.dart';
// import 'package:otlobly/screens/home/home_default.dart';
// import 'package:otlobly/screens/wrapper.dart';
// import 'package:otlobly/services/auth.dart';
// import 'package:otlobly/services/store.dart';

// class EditProfilePage extends StatefulWidget {
//   @override
//   _EditProfilePageState createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   final AuthService _auth = AuthService();
//   final _store = Store();
//   final _formKey = GlobalKey<FormState>();

//   String error = '';

//   @override
//   Widget build(BuildContext context) {
//     User users=ModalRoute.of(context).settings.arguments;
//     final fullNameController=TextEditingController(text: users.uName);
//     final mobileController=TextEditingController(text: users.uMobile);
//     final addressController=TextEditingController(text: users.uAddress);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Update Profile'),
//         backgroundColor: Colors.red,
//       ),
//       body: ListView(
//         padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
//         children: [
//           Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: fullNameController,
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return ('Full Name');
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: mobileController,
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return ('Mobile Number');
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   controller: addressController,
//                   validator: (value) {
//                     if (value.isEmpty) {
//                       return ('Address');
//                     } else {
//                       return null;
//                     }
//                   },
//                 ),
                
//                 SizedBox(height: 20),
//                 SizedBox(
//                   height: 12.0,
//                 ),
//                 Text(
//                   error,
//                   style: TextStyle(color: Colors.red, fontSize: 14.0),
//                 ),
//                 RaisedButton(
//                   onPressed: () {
//                     print(fullNameController.text);
//                     print(mobileController.text);
//                     print(addressController.text);
//                   },
//                 ),
//                 RaisedButton(
//                   onPressed: () {
//                     if (_formKey.currentState.validate()) {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => HomeDefault()));
//                       _store.editUser(
//                           ({
//                             'UserName': fullNameController.text,
//                             'UserMobile': mobileController.text,
//                             'UserAddress': addressController.text,
//                           }),
//                           users.uid);
//                     } else {
//                       print('Error');
//                     }
//                   },
//                   child: Text('SAVE CHANGES'),
//                   color: Colors.redAccent,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18.0),
//                     side: BorderSide(color: Colors.red),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:otlobly/models/user.dart';
import 'package:otlobly/screens/home/home_admin.dart';
import 'package:otlobly/screens/home/home_default.dart';
import 'package:otlobly/services/auth.dart';
import 'package:otlobly/services/store.dart';

import '../wrapper.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final AuthService _auth = AuthService();
  final _store = Store();
  final _formKey = GlobalKey<FormState>();

  String error = '';

  @override
  Widget build(BuildContext context) {
    Map userData = ModalRoute.of(context).settings.arguments;
    print(userData);
     final nameController = TextEditingController(text: userData['userName']);
     final emailController = TextEditingController(text: userData['userEmail']);
     //final passwordController = TextEditingController(text: users['Uid']);
     final addressController = TextEditingController(text: userData['userAddress']);
     final typeController = TextEditingController(text: userData['userType']);
    final mobileController = TextEditingController(text: userData['userMobile']);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User'),
        backgroundColor: Colors.red,
        actions: [
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Wrapper()));
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
                      userData['userEmail'],
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
                       Navigator.pushNamed(
                                          context,
                                          '/homeDefault',
                                           arguments: userData,
                                        );
                      _store.editUser(
                          ({
                            'UserName': nameController.text,
                            // 'UserEmail': emailController.text,
                            // 'UserPassword': passwordController.text,
                            // 'UserType': typeController.text,
                            'UserAddress': addressController.text,
                            'UserMobile': mobileController.text,
                          }),
                          userData['userID']);
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
