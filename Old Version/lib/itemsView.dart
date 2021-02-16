import 'package:flutter/material.dart';
import 'package:flutter_app_project/cartView.dart';
import 'package:flutter_app_project/itemsData.dart';
import 'package:flutter_app_project/detailsView.dart';

var count = -1;

class itemsView extends StatefulWidget {
  _itemsViewState createState() => _itemsViewState();
}

class _itemsViewState extends State<itemsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PRODUCTS'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_left,
          ),
          onPressed: null,
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          IconButton(
              icon: Icon(
                Icons.shopping_bag_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartView()));
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MARKET',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            ),
            SizedBox(
              height: 18,
            ),
            CartItem(),
            CartItem(),
            CartItem(),
            SizedBox(
              height: 21,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  CartItem({
    Key key,
  }) : super(key: key);
  final IProductData appLogic = IProductData();

  @override
  Widget build(BuildContext context) {
    count = count + 1;
    if (count == 3) {
      count = 0;
      print(count);
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: AssetImage('images/Chocolate.jpg'),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  child: Text(
                    appLogic.getProduct(count)[0],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        '1',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          appLogic.getProduct(count)[2],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add_shopping_cart,
                          ),
                          onPressed: null,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.view_carousel,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Details()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
