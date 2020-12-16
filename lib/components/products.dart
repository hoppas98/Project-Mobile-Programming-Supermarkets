import 'package:flutter/material.dart';
import 'package:flutter_app6/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
          return SingleProduct(
            productName: productList[index]['productName'],
            productPicture: productList[index]['productPicture'],
            productOldPrice: productList[index]['oldPrice'],
            productCurrentPrice: productList[index]['currentPrice'],
          );
        });
  }
}

class SingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final productOldPrice;
  final productCurrentPrice;

  SingleProduct({
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
