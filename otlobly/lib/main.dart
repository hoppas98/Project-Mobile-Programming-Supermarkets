import 'package:flutter/material.dart';
import 'package:otlobly/screens/admin/edit_user.dart';
import 'package:otlobly/screens/owner/edit_product.dart';
import 'package:otlobly/screens/wrapper.dart';
import 'package:otlobly/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      child: MaterialApp(
        routes: {
          '/wrapper': (context) => Wrapper(),
          '/editPage': (context) => EditProduct(),
          '/editUser': (context) => EditUser(),
        },
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
