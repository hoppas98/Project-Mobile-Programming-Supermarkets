import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final productDetailsName;
  final productDetailsPicture;
  final productDetailsOldPrice;
  final productDetailsCurrentPrice;

  ProductDetails(
      {this.productDetailsName,
      this.productDetailsPicture,
      this.productDetailsOldPrice,
      this.productDetailsCurrentPrice});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Otlobly App'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                print('Search Button');
              }),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                print('Open Cart Button');
              })
        ],
      ),
      body: ListView(
        children: [
          Center(
              child: Text(
            widget.productDetailsName,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          )),
          Container(
            height: 250,
            child: GridTile(
              child: Container(
                child: Image.asset(widget.productDetailsPicture),
              ),
              footer: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Text('Price'),
                  title: Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                              "EGP " + '${widget.productDetailsCurrentPrice}',
                              style: TextStyle(color: Colors.black)),
                        ),
                        Expanded(
                          child:
                              Text("EGP " + '${widget.productDetailsOldPrice}',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  )),
                        ),
                        Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: RaisedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Quantity'),
                    content: Text('Choose the quantity'),
                    actions: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop(context);
                        },
                        child: Text('Close'),
                      )
                    ],
                  ),
                );
              },
              color: Colors.white,
              textColor: Colors.black,
              child: Row(
                children: [
                  Expanded(
                    child: Text('Quantity'),
                  ),
                  Expanded(
                    child: Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              child: RaisedButton(
                onPressed: () {},
                color: Colors.red,
                textColor: Colors.white,
                child: Text('Add to cart'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
