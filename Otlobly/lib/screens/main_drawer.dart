import 'package:flutter/material.dart';
import 'package:Otlobly/main.dart';
import 'package:Otlobly/screens/profile.dart';
//import './home-screen.dart';
import 'package:Otlobly/screens/details.dart';

class main_drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.0),
          color: Theme.of(context).primaryColor,
          child: Center(
              child: Column(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://www.logopik.com/wp-content/uploads/edd/2018/07/Online-Shopping-Logo-PNG.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )),
        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('profile'),
          onTap: () {
            Navigator.of(context).pushNamed('/profile');
          },
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            Navigator.of(context).pushNamed('/home');
          },
        ),
        ListTile(
          leading: Icon(Icons.add_shopping_cart),
          title: Text('Cart'),
          onTap: () {
            Navigator.of(context).pushNamed('/cartView');
          },
        ),
        ListTile(
          leading: Icon(Icons.arrow_back),
          title: Text('Logout'),
          onTap: null,
        ),
      ]),
    );
  }
}
