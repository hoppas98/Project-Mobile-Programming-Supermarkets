import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/cart_items_bloc.dart';

class Checkout_final extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout & Proceed')),
      body: StreamBuilder(
        stream: bloc.getStream,
        initialData: bloc.allItems,
        builder: (context, snapshot) {
          return snapshot.data['cart items'].length > 0
              ? Column(
                  children: <Widget>[
                    /// The [checkoutListBuilder] has to be fixed
                    /// in an expanded widget to ensure it
                    /// doesn't occupy the whole screen and leaves
                    /// room for the the RaisedButton
                    Expanded(child: checkoutListBuilder(snapshot)),
                    Text('Fill this form please:'),

                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your name',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your phone number',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your address',
                      ),
                    ),

                    Text('Price: EGP 9.5'),
                    Text('Shipping Fees: EGP 20'),
                    Text('Total Price: EGP 39.5'),

                    RaisedButton(
                      onPressed: () => Navigator.pushNamed(
                          context, '/checkout_Confirmation_Message'),
                      child: Text("Proceed"),
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(height: 40),
                  ],
                )
              : Center(child: Text("You haven't taken any item yet"));
        },
      ),
    );
  }
}

Widget checkoutListBuilder(snapshot) {
  return ListView.builder(
    itemCount: snapshot.data["cart items"].length,
    itemBuilder: (BuildContext context, i) {
      final cartList = snapshot.data["cart items"];
      return ListTile(
        title: Text(cartList[i]['name']),
        subtitle: Text("EGP ${cartList[i]['price']}"),
        onTap: () {},
      );
    },
  );
}
