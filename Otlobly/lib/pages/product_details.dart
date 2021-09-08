import 'package:flutter/material.dart';
import 'package:Otlobly/screens/homepage.dart';

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
        title: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new HomePage()));
            },
            child: Text('Otlobly')),
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
          Divider(),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text("Similar Products")),
          Container(
            height: 300.0,
            child: Similar_products(),
          )
        ],
      ),
    );
  }
}

class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  var productList = [
    {
      'productName': 'Galaxy',
      'productPicture': 'images/ChocolateGalaxy.jpg',
      'oldPrice': 10,
      'currentPrice': 7,
    },
    {
      'productName': 'Pepsi Can',
      'productPicture': 'images/PepsiCan.jpg',
      'oldPrice': 5,
      'currentPrice': 4.5,
    },
    {
      'productName': 'Pepsi Bottle',
      'productPicture': 'images/PepsiBottle.jpg',
      'oldPrice': 10,
      'currentPrice': 9,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Similar_SingleProduct(
            productName: productList[index]['productName'],
            productPicture: productList[index]['productPicture'],
            productOldPrice: productList[index]['oldPrice'],
            productCurrentPrice: productList[index]['currentPrice'],
          );
        });
  }
}

class Similar_SingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final productOldPrice;
  final productCurrentPrice;

  Similar_SingleProduct({
    this.productName,
    this.productPicture,
    this.productOldPrice,
    this.productCurrentPrice,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: productName,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetails(
                      productDetailsName: productName,
                      productDetailsPicture: productPicture,
                      productDetailsOldPrice: productOldPrice,
                      productDetailsCurrentPrice: productCurrentPrice,
                    ))),
            child: GridTile(
              footer: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Text(
                    productName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text("EGP " + "$productCurrentPrice",
                      style: TextStyle(color: Colors.red)),
                  subtitle: Text("EGP " + "$productOldPrice",
                      style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                      )),
                ),
              ),
              child: Image.asset(
                productPicture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
