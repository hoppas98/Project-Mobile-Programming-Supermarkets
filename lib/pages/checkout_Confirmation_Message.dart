import 'package:flutter/material.dart';

class Checkout_Confirmation_Mesage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('')),
        body: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Thank you for using our application'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => Navigator.pushNamed(context, '/'),
                    child: Text("Back"),
                    color: Theme.of(context).primaryColor,
                  ),
                ]),
          ],
        )));
  }
}
