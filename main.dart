import 'package:abdo/Profilepage.dart';
import 'package:abdo/pages/checkout.dart';
import 'package:abdo/pages/checkout_final.dart';
import 'package:abdo/pages/shop_items.dart';
import 'package:abdo/pages/checkout_Confirmation_Message.dart';
import 'package:abdo/pages/Details.dart';
import 'package:flutter/material.dart';
import 'package:abdo/LoginPage.dart';
import 'package:abdo/SignupPage.dart';
import 'package:abdo/home-screen.dart';
import 'package:abdo/Profilepage.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(255, 144, 0, .1),
      100: Color.fromRGBO(255, 144, 0, .2),
      200: Color.fromRGBO(255, 144, 0, .3),
      300: Color.fromRGBO(255, 144, 0, .4),
      400: Color.fromRGBO(255, 144, 0, .5),
      500: Color.fromRGBO(255, 144, 0, .6),
      600: Color.fromRGBO(255, 144, 0, .7),
      700: Color.fromRGBO(255, 144, 0, .8),
      800: Color.fromRGBO(255, 144, 0, .9),
      900: Color.fromRGBO(255, 144, 0, 1),
    };
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFFF7000, color),
      ),
      initialRoute: '/Profilepage',
      routes: {
        '/shop_items': (BuildContext context) => ShopItems(),
        '/Details': (BuildContext context) => Details(),
        '/checkout': (BuildContext context) => Checkout(),
        '/checkout_final': (BuildContext context) => Checkout_final(),
        '/home-screen': (BuildContext context) => HomeScreen(),
        '/Profilepage': (BuildContext context) => ProfilePage(),
        '/LoginPage': (BuildContext context) => MyHomePage(),
        '/signup': (BuildContext context) => new SignupPage(),
        '/checkout_Confirmation_Message': (BuildContext context) =>
            Checkout_Confirmation_Mesage()
      },
      home: MyHomePage(),
    );
  }
}
