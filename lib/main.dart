import 'package:flutter/material.dart';
import 'package:flutter_app_project/itemsView.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: itemsView(),
    );
  }
}
