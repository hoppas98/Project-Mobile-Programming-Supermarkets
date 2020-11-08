import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
//import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications, color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          )
        ],
        title: RichText(
          text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(fontWeight: FontWeight.bold),
            children: [
              WidgetSpan(
                child: Icon(Icons.shop, size: 25),
              ),
              TextSpan(
                text: "Supermarket",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: CircularProgressIndicator(),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                image: DecorationImage(
                  image: AssetImage('images/download.jpg'),
                ),
              ),
            ),
          ),
          Center(
            child: RaisedButton(
                onPressed: () => Navigator.pushNamed(context, '/LoginPage'),
                child: Text("Login"),
                color: Colors.white),
          ),
          SizedBox(height: 40),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.menu),
        backgroundColor: Colors.orange,
        onPressed: () {},
      ),
    );
  }
}
