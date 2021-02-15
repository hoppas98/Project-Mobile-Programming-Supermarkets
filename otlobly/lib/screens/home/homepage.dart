import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:otlobly/screens/admin/display_products.dart';
import 'package:otlobly/screens/client/about.dart';
import 'package:otlobly/screens/client/data.dart';
import 'package:otlobly/screens/client/myaccount.dart';
import 'package:otlobly/screens/client/settings.dart';
import '../../components/horizontal_listview.dart';
import '../../components/products.dart';
import 'package:otlobly/pages/cart.dart';
import 'package:otlobly/screens/authenticate/sign_in.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Slider
  bool searchState=false;
  // TextEditingController searchTextEditingController= TextEditingController();
  // Future<QuerySnapshot> futureSearchResults;
  
  // controlSearching(){
  //   Future<QuerySnapshot> product=ViewProducts().where("productName", isGreater)
  // }
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: !searchState?Text("Otlobly"):
                            TextFormField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.search),
                                hintText:"Search...",
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
                                          !searchState?IconButton(
                                              icon: Icon(
                                                Icons.search,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  searchState=!searchState;
                                                });
                                              }
                                              ):
                                              IconButton(
                                              icon: Icon(
                                                Icons.cancel,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  searchState=!searchState;
                                                });
                                              }
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
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) {
                                                      return SignIn();
                                                    },
                                                  ),
                                                );
                                              },
                                              icon: Icon(Icons.person, color: Colors.white),
                                              label: Text('Login', style: TextStyle(color: Colors.white)))
                                        ],
                                      ),
                                
                                      // Drawer
                                      drawer: Drawer(
                                        child: ListView(
                                          children: [
                                            UserAccountsDrawerHeader(
                                              accountName: Text('User'),
                                              accountEmail: Text("Email"),
                                              currentAccountPicture: GestureDetector(
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.grey,
                                                  child: Icon(
                                                    Icons.person,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(builder: (context) => HomePage()));
                                              },
                                              child: ListTile(
                                                title: Text('Home Page'),
                                                leading: Icon(Icons.home),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => EditProfilePage()),
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
                                                leading: Icon(Icons.settings, color: Colors.blue),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => AboutPage()),
                                              ),
                                              child: ListTile(
                                                title: Text('About us'),
                                                leading: Icon(Icons.help),
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
