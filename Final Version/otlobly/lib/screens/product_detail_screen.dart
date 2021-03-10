import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/products.dart';
import 'package:otlobly/models/product.dart';

import '../models/cart.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<ProductsState>(
      context,
      listen: false,
    ).findById(productId);
    print(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.pName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                loadedProduct.pLocation,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$${loadedProduct.pPrice}',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                loadedProduct.pDescription,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              child: Text(
                "Shippment takes from 10 to 15 min",
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
            new GestureDetector(
                child: Container(
                  margin: EdgeInsets.only(right: 25),
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "only 2 left ",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Add to cart",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  cart.addItem(loadedProduct.pId, loadedProduct.pPrice,
                      loadedProduct.pName);
                  /*Scaffold.of(context).hideCurrentSnackBar();
                     Scaffold.of(context).showSnackBar(
                       SnackBar(
                         content: Text(
                           'Added item to cart!',
                         ),
                         duration: Duration(seconds: 2),
                         action: SnackBarAction(
                           label: 'UNDO',
                           onPressed: () {
                             cart.removeSingleItem(loadedProduct.id);
                           },
                         ),
                       )
                    );*/
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text('Are you sure?'),
                      content: Text(
                        'Do you want to add this item cart?',
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('No'),
                          onPressed: () {
                            cart.removeSingleItem(loadedProduct.pId);
                            Navigator.of(ctx).pop(false);
                          },
                        ),
                        FlatButton(
                          child: Text('Yes'),
                          onPressed: () {
                            Navigator.of(ctx).pop(false);
                            // Navigator.of(ctx).pop(true);
                          },
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
