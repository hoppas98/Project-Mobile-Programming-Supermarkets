import 'package:Otlobly/screens/profile.dart';
import 'package:Otlobly/screens/cartView.dart';
import 'package:Otlobly/screens/item_info.dart';
import 'package:Otlobly/screens/itemsData.dart';
import 'package:Otlobly/screens/itemsView.dart';
import 'package:Otlobly/screens/confirmationPage.dart';
import 'package:Otlobly/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:Otlobly/screens/login.dart';
import 'package:Otlobly/screens/signup.dart';
import 'package:Otlobly/screens/home.dart';
import 'package:flutter/animation.dart';

void main() => runApp(LogoApp());

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
      initialRoute: '/home',
      routes: {
        '/itemsView': (BuildContext context) => itemsView(),
        '/details': (BuildContext context) => Details(),
        '/cartView': (BuildContext context) => CartView(),
        '/home': (BuildContext context) => MyMainPage(),
        '/profile': (BuildContext context) => ProfilePage(),
        '/login': (BuildContext context) => Login(),
        '/item_info': (BuildContext context) => ItemInfo(),
        '/signup': (BuildContext context) => new SignupPage(),
        '/confirmationPage': (BuildContext context) => confirmationMessage()
      },
      home: MyMainPage(),
    );
  }
}

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyMainPage()),
        );
      }
    });
  }

  Widget build(BuildContext context) {
    return AnimatedLogo(animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}
