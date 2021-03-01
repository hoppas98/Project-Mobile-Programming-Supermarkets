import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:otlobly/screens/admin/add_user.dart';
import 'package:otlobly/screens/admin/manage_users.dart';
import 'package:otlobly/screens/admin/view_users.dart';
import 'package:otlobly/screens/admin/view_users_chart.dart';
import 'package:otlobly/screens/admin/view_orders.dart';
import 'package:otlobly/screens/wrapper.dart';
import 'package:otlobly/services/auth.dart';

class HomeAdmin extends StatefulWidget {
  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  final AuthService _auth = AuthService();

  @override
  Widget imageCarousel = Container(
    padding: EdgeInsets.all(10),
    height: 300.0,
    child: Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('images/Slider_p1.jpg'),
        AssetImage('images/Slider_p2.jpg'),
        AssetImage('images/Slider_p3.jpg'),
        AssetImage('images/Slider_p4.jpg'),
        AssetImage('images/Slider_p5.jpg'),
      ],
      autoplay: true,
      dotSize: 4.0,
      indicatorBgPadding: 2.0,
      dotBgColor: Colors.transparent,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
    ),
  );

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
        backgroundColor: Colors.red,
        actions: [
          FlatButton.icon(
            onPressed: () async {
              await _auth.signOut();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Wrapper()));
            },
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: Text('Logout',
                style: TextStyle(
                  color: Colors.white,
                )),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Column(
              children: [
                imageCarousel,
                Container(
                  margin: EdgeInsets.all(1.0),
                  height: 275.0,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddUser()));
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.upload_file,
                                      size: 50,
                                    ),
                                    Text(
                                      'Add an User',
                                      style: TextStyle(fontSize: 12.5),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ManageUsers()));
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        size: 50,
                                      ),
                                      Text(
                                        'Edit an User',
                                        style: TextStyle(fontSize: 12.5),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewOrders()));
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.attach_money_outlined,
                                        size: 50,
                                      ),
                                      Text(
                                        'View Orders',
                                        style: TextStyle(fontSize: 12.5),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ViewUsers()));
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.view_carousel_sharp,
                                      size: 50,
                                    ),
                                    Text(
                                      'View Users',
                                      style: TextStyle(fontSize: 12.5),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewUsersChart()));
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.bar_chart,
                                        size: 50,
                                      ),
                                      Text(
                                        'Statistics',
                                        style: TextStyle(fontSize: 12.5),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
