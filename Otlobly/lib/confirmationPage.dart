import 'package:flutter/material.dart';
import 'package:otlobly/cartView.dart';
import 'package:otlobly/itemsView.dart';

void main() => runApp(confirmationMessage());

class confirmationMessage extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('CONFIRMATION MESSAGE'),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_left,
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartView()));
            },
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your order has been confirmed'),
            Text('THANK YOU'),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                // Navigator.pop(context);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => confirmationMessage()));
              },
              color: Colors.cyan,
              child: Text(
                'Return HOMEPAGE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
