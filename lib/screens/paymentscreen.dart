import 'package:flutter/material.dart';
import '../models/orders.dart';
import 'package:provider/provider.dart' as provider;
import '../models/cart.dart' show Cart;
import '../components/products.dart';
import '../components/cart_item.dart';
import '../models/orders.dart';

class Paymentmethod extends StatefulWidget {
  static const routeName = '/Paymentmethod';
  @override
  _PaymentmethodState createState() => _PaymentmethodState();
}

class _PaymentmethodState extends State<Paymentmethod> {
  @override
  Widget build(BuildContext context) {
    final cart = provider.Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Payment method'),
        ),
        body: Column(children: <Widget>[
          new GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Are you sure?'),
                    content: Text(
                      'You want to place order?',
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('No'),
                        onPressed: () {
                          // cart.removeSingleItem(loadedProduct.id);
                          Navigator.of(ctx).pop(false);
                        },
                      ),
                      FlatButton(
                        child: Text('Yes'),
                        onPressed: () {
                          //Navigator.of(ctx).pop(false);
                          // Navigator.of(ctx).pop(true);
                          provider.Provider.of<Orders>(context, listen: false)
                              .addOrder(
                            cart.items.values.toList(),
                            cart.totalAmount,
                          );

                          cart.clear();
                          Navigator.of(context).pushReplacementNamed('/');

                          /* provider.Provider.of<Orders>(context, listen: false)
                              .addtoallorders();*/
                        },
                      ),
                    ],
                  ),
                );
              },
              child: Card(
                  margin: EdgeInsets.all(20),
                  child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(Icons.attach_money),
                            Text(
                              'COD Cash on delievery',
                              style: TextStyle(fontSize: 20),
                            ),
                          ])))),
          Card(
              margin: EdgeInsets.all(20),
              child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.credit_card),
                        Text(
                          'Credit card payment',
                          style: TextStyle(fontSize: 20),
                        ),
                      ])))
        ]));
  }
}
