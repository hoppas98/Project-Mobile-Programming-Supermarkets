import 'package:flutter/material.dart';
import 'package:Otlobly/categories/dairy.dart';
import 'package:Otlobly/categories//fruits.dart';
import 'package:Otlobly/categories//nuts.dart';
import 'package:Otlobly/categories//vegetables.dart';

class MyMainPage extends StatefulWidget {
  MyMainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyMainPageState createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 25,
                ),
                Spacer(),
                Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                  size: 25,
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Wrap(
            children: <Widget>[
              RaisedButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  child: Text("Login"),
                  color: Colors.green),
              SizedBox(
                width: 40,
              ),
              RaisedButton(
                  onPressed: () => Navigator.pushNamed(context, '/signup'),
                  child: Text("Register"),
                  color: Colors.red),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: Colors.grey, width: 0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Search here",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontFamily: 'OpenSans'),
                    ),
                    Spacer(),
                    Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          TabBar(
              controller: tabController,
              indicatorColor: Colors.green,
              indicatorWeight: 3.0,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "Fruits",
                    style: TextStyle(fontSize: 15, fontFamily: 'OpenSans'),
                  ),
                ),
                Tab(
                  child: Text(
                    "Vegetables",
                    style: TextStyle(fontSize: 15, fontFamily: 'OpenSans'),
                  ),
                ),
                Tab(
                  child: Text(
                    "Nuts & Seeds",
                    style: TextStyle(fontSize: 15, fontFamily: 'OpenSans'),
                  ),
                ),
                Tab(
                  child: Text(
                    "Dairy",
                    style: TextStyle(fontSize: 15, fontFamily: 'OpenSans'),
                  ),
                ),
              ]),
          Expanded(
            child: Container(
              child: TabBarView(controller: tabController, children: <Widget>[
                Fruits(),
                Vegetables(),
                Nuts(),
                Dairy(),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
