import 'package:flutter/material.dart';
import 'package:otlobly/pages/cart.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var products_in_cart = [
    {
      'name': 'Galaxy',
      'picture': 'images/ChocolateGalaxy.jpg',
      'price': 7,
      "quantity": 1,
    },
    {
      'name': 'Pepsi Can',
      'picture': 'images/PepsiCan.jpg',
      'price': 4.5,
      "quantity": 1,
    },
    {
      'name': 'Pepsi Bottle',
      'picture': 'images/PepsiBottle.jpg',
      'price': 9,
      "quantity": 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: products_in_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_productName: products_in_cart[index]["name"],
            cart_productPicture: products_in_cart[index]["picture"],
            cart_productPrice: products_in_cart[index]["price"],
            cart_Product_qty: products_in_cart[index]["quantity"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_productName;
  final cart_productPicture;
  final cart_productPrice;
  final cart_Product_qty;

  Single_cart_product({
    this.cart_productName,
    this.cart_productPicture,
    this.cart_productPrice,
    this.cart_Product_qty,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: new Image.asset(
          cart_productPicture,
          width: 60.0,
        ),
        title: new Text(
          cart_productName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: new Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "EGP ${cart_productPrice}",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ],
        ),
        isThreeLine: true,
        enabled: true,
        trailing: new Column(
          children: <Widget>[
            new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: () {}),
            new Text("${cart_Product_qty}"),
            new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: () {})
          ],
        ),
      ),
    );
  }
}
