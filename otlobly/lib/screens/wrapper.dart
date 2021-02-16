import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:otlobly/models/user.dart';
import 'package:flutter/material.dart';
import 'package:otlobly/screens/home/home_admin.dart';
import 'package:otlobly/screens/home/homepage.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

final usersRef = Firestore.instance.collection('Users');

class _WrapperState extends State<Wrapper> {
  // void initState() {
  //   //getUsers();
  //   //getUserById();
  //   super.initState();
  // }

  // getUserById() {
  //   final String id = "DmmkLuygEQInys70QpTS";
  //   usersRef.document(id).get().then((DocumentSnapshot doc) {
  //     print('${doc.data['UserType']}');
  //   });
  // }
  // getUsers() {
  //   usersRef.getDocuments().then((QuerySnapshot snapshot) {
  //     snapshot.documents.forEach((DocumentSnapshot doc) {
  //       print('Here ${doc.data}');
  //     });
  //   });
  // }
  // getUsersType(String email) async {
  //   usersRef.getDocuments().then((QuerySnapshot snapshot) {
  //     snapshot.documents.forEach((DocumentSnapshot doc) {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return HomePage();
    } else {
      return HomeAdmin();
    }
  }
}
