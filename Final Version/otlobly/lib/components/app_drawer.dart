import 'package:flutter/material.dart';
//import 'package:flutter_complete_guide/screens/Payment.dart';
import '../screens/paymentscreen.dart';

import '../screens/orders_screen.dart';
//import '../screens/user_products_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map userData = ModalRoute.of(context).settings.arguments;

    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Otlobly'),
            backgroundColor: Colors.red,
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushNamed(
                '/homeDefault',
                arguments: userData,
              );
            },
          ),
          Divider(),
          // ListTile(
          //   leading: Icon(Icons.payment),
          //   title: Text('Orders'),
          //   onTap: () {
          //     Navigator.of(context)
          //         .pushReplacementNamed(OrdersScreen.routeName);
          //   },
          // ),
          /*Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment method'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(Paymentmethod.routeName);
            },
          ),*/
        ],
      ),
    );
  }
}
