import 'package:flutter/material.dart';
import 'package:otlobly/itemsView.dart';
import 'package:otlobly/cartView.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_left,
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => itemsView()));
          },
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffacf4ff),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)),
                  image: DecorationImage(
                    image: AssetImage('images/Chocolate.jpg'),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.white,
              child: ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Chocolate Box',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '\$50.50',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w600),
                        ),
                        Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                              color: Color(0xffacf4ff),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.remove)),
                              Text('1'),
                              Expanded(
                                  child: IconButton(
                                      onPressed: () {}, icon: Icon(Icons.add)))
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      'About Product :',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        "12 Assorted Luxury Chocolate Truffles, packaged in our deluxe Adora chocolate gift box and tied with ribbon., A beautiful gift for family and friends .."),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        width: double.infinity,
                        height: 50,
                        child: RaisedButton(
                            color: Color(0xffacf4ff),
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text('Add to Cart')),
                      ),
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
