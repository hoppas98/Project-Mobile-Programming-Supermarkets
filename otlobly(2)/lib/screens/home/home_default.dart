import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:otlobly/screens/client/about.dart';
import 'package:otlobly/screens/client/myaccount.dart';
import 'package:otlobly/screens/client/settings.dart';
import 'package:otlobly/screens/home/homeUser.dart';

import 'package:otlobly/screens/wrapper.dart';
import 'package:otlobly/services/auth.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../../components/horizontal_listview.dart';
import '../../components/products.dart';
import 'package:otlobly/pages/cart.dart';

class HomeDefault extends StatefulWidget {
  @override
  _HomeDefaultState createState() => _HomeDefaultState();
}

class _HomeDefaultState extends State<HomeDefault> {
  final usersRef = Firestore().collection('Users');
  var seachWord = "";

  final AuthService _auth = AuthService();
  bool searchState = false;
  // Slider
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

  // AppBar
  @override
  Widget build(BuildContext context) {
    Map userData = ModalRoute.of(context).settings.arguments;
    Map userData_2;
    // final String id = userData['userID'];
    // usersRef.document(id).get().then((DocumentSnapshot doc) {
    //   print('${doc.data['UserName']}');
    //   userData_2 = {
    //     'userID': doc.documentID,
    //     'userName': doc.data['UserName'],
    //     'userEmail': doc.data['UserEmail'],
    //     'userMobile': doc.data['UserMobile'],
    //     'userType': doc.data['UserType'],
    //     'userAddress': doc.data['UserAddress']
    //   };
    // });

    usersRef
        .where('UserEmail', isEqualTo: userData['userEmail'])
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((DocumentSnapshot doc) {
        userData_2 = {
          'userID': doc.documentID,
          'userName': doc.data['UserName'],
          'userEmail': doc.data['UserEmail'],
          'userMobile': doc.data['UserMobile'],
          'userType': doc.data['UserType'],
          'userAddress': doc.data['UserAddress']
        };
      });
    });

    print('--->${userData}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: !searchState
            ? Text("Otlobly")
            : TextFormField(
                onChanged: (value) {
                  setState(() {
                    seachWord = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                // controller: searchTextEditingController,
                // onFieldSubmitted: controlSearching,
                // onChanged: (text){
                //   SearchMethod(text);
                //   },
              ),
        actions: [
          !searchState
              ? IconButton(
                  icon: Icon(
                    Icons.add_circle_outline_outlined,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      searchState = !searchState;
                    });
                  })
              : IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      searchState = !searchState;
                    });
                  }),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/results',
                arguments: seachWord,
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => new Cart()));
            },
          ),
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

      // Drawer
      drawer: Drawer(
        child: ListView(
          children: [
            // UserAccountsDrawerHeader(
            //   accountName: Text('Mohamed Hoppas'),
            //   accountEmail: Text("Mohamed1710193@miuegypt.edu.eg"),
            //   currentAccountPicture: GestureDetector(
            //     child: CircleAvatar(
            //       backgroundColor: Colors.grey,
            //       child: Icon(
            //         Icons.person,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            //   decoration: BoxDecoration(
            //     color: Colors.red,
            //   ),
            // ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomeUser()));
              },
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(
                context,
                '/myAccount',
                arguments: userData_2,
              ),
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person),
              ),
            ),
            InkWell(
              onTap: () {
                print('Go to my Orders');
              },
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),
            InkWell(
              onTap: () {
                print('Go to Categories');
              },
              child: ListTile(
                title: Text('Categories'),
                leading: Icon(Icons.dashboard),
              ),
            ),
            InkWell(
              onTap: () {
                print('Go to my Favories');
              },
              child: ListTile(
                title: Text('Favorite'),
                leading: Icon(Icons.favorite),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Cart()));
              },
              child: ListTile(
                title: Text('Cart'),
                leading: Icon(Icons.shopping_cart),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              ),
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutPage()));
              },
              child: ListTile(
                title: Text('About app'),
                leading: Icon(Icons.help, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          imageCarousel,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Categories'),
          ),
          HorizontalList(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Recent products"),
          ),
          Container(
            height: 300.0,
            child: Products(),
          ),
        ],
      ),
    );
  }
}
