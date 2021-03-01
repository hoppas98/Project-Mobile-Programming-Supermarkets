import 'package:flutter/material.dart';
import 'package:otlobly/screens/admin/edit_user.dart';
import 'package:otlobly/screens/client/changepass.dart';
import 'package:otlobly/screens/client/search_results.dart';
import 'package:otlobly/screens/client/settings.dart';
import 'package:otlobly/screens/home/home_admin.dart';
import 'package:otlobly/screens/home/home_default.dart';
import 'package:otlobly/screens/home/home_owner.dart';
import 'package:otlobly/screens/owner/add_products.dart';
import 'package:otlobly/screens/owner/display_products.dart';
import 'package:otlobly/screens/owner/edit_product.dart';
import 'package:otlobly/screens/owner/manage_product.dart';
import 'package:otlobly/screens/wrapper.dart';
import 'package:otlobly/services/auth.dart';
import 'package:otlobly/screens/client/myaccount.dart';
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
          '/homeDefault': (context) => HomeDefault(),
          '/myAccount': (context) => EditProfilePage(),
          '/results': (context) => SeachResult(),
          '/homeOwner': (context) => HomeOwner(),
          '/addProduct': (context) => AddProduct(),
          '/manageProducts': (context) => ManageProduct(),
          '/viewProducts': (context) => ViewProducts(),
          '/View_users_chart': (context) => ViewProducts(),
          '/settings': (context) => SettingsPage(),
          '/changepass': (context) => UpdatePassword(),
        },
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
