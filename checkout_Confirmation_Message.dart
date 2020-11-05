import 'package:flutter/material.dart';

class Checkout_Confirmation_Mesage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('')),
        body: Container(
            child: Row(
          children: <Widget>[
            Column(children: <Widget>[
              Text('DONE'),
              Text('THANK YOU FOR MAKING ORDER WITH US'),
            ]),
            RaisedButton(
              onPressed: () => Navigator.pushNamed(context, '/'),
              child: Text("Back"),
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 40),
          ],
        )));
  }
}
