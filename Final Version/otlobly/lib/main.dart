import 'package:flutter/material.dart';
import 'package:otlobly/screens/admin/edit_user.dart';
import 'package:otlobly/screens/client/categories.dart';
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
import 'package:otlobly/screens/products_overview_screen.dart';
import 'package:otlobly/screens/wrapper.dart';
import 'package:otlobly/services/auth.dart';
import 'package:otlobly/screens/client/myaccount.dart';
import 'package:provider/provider.dart';
import 'package:otlobly/components/products.dart';
import 'package:otlobly/models/cart.dart';
import 'package:otlobly/models/orders.dart';
import 'package:otlobly/screens/product_detail_screen.dart';
import 'package:otlobly/screens/cart_screen.dart';
import 'package:otlobly/screens/orders_screen.dart';
import 'package:otlobly/screens/paymentscreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _message = '';

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    getMessage();
  }

  void getMessage() {
    _firebaseMessaging.getToken().then((token) {
      print('FBM Tokken $token');
    });
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print('on message $message');
      setState(() => _message = message["notification"]["title"]);
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
      setState(() => _message = message["notification"]["title"]);
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() => _message = message["notification"]["title"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider.value(
          value: AuthService().user,
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
        ChangeNotifierProvider.value(
          value: ProductsState(),
        )
      ],
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
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          // UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          //EditProductScreen.routeName: (ctx) => EditProductScreen(),
          // Payment.routeName: (ctx) => Payment(10,'dell','Ahmed'),
          Paymentmethod.routeName: (ctx) => Paymentmethod(),
          '/show_category': (context) => ShowCategory(),
          '/my_orders': (context) => OrdersScreen(),
          '/products_overview': (context) => ProductsOverviewScreen(),
        },
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
    /*  MultiProvider(
            
          providers: [
            ChangeNotifierProvider.value(
              value: Products(),
            ),
            ChangeNotifierProvider.value(
              value: Cart(),
            ),
            ChangeNotifierProvider.value(
              value: Orders(),
            ),
            
          ],
        );*/
  }
}
