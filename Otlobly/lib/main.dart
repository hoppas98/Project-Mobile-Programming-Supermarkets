import 'package:flutter/material.dart';
import 'package:otlobly/screens/admin/edit_product.dart';
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
          '/editPage': (context) => EditProduct(),
        },
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
