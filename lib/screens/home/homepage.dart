import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:otlobly/screens/authenticate/register.dart';
import 'package:otlobly/screens/client/about.dart';
import '../../components/horizontal_listview.dart';
import '../../components/products.dart';
import 'package:otlobly/screens/authenticate/sign_in.dart';
import 'package:otlobly/screens/products_overview_screen.dart';
import 'package:otlobly/screens/orders_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Slider
  bool searchState = false;
  var seachWord = "";
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
            // UserAccountsDrawerHeader(
            //   accountName: Text('User'),
            //   accountEmail: Text("Email"),
            //   decoration: BoxDecoration(
            //     color: Colors.red,
            //   ),
            // ),
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
                MaterialPageRoute(builder: (context) => Register()),
              ),
              child: ListTile(
                title: Text('Sign up'),
                leading: Icon(Icons.person),
              ),
            ),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrdersScreen()),
              ),
              child: ListTile(
                title: Text('orders'),
                leading: Icon(Icons.person),
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     print('Go to my Orders');
            //   },
            //   child: ListTile(
            //     title: Text('My Orders'),
            //     leading: Icon(Icons.shopping_basket),
            //   ),
            // ),
            // InkWell(
            //   onTap: () {
            //     print('Go to Categories');
            //   },
            //   child: ListTile(
            //     title: Text('Categories'),
            //     leading: Icon(Icons.dashboard),
            //   ),
            // ),
            // InkWell(
            //   onTap: () {
            //     print('Go to my Favories');
            //   },
            //   child: ListTile(
            //     title: Text('Favorite'),
            //     leading: Icon(Icons.favorite),
            //   ),
            // ),
            // InkWell(
            //   onTap: () {
            //     Navigator.of(context)
            //         .push(MaterialPageRoute(builder: (context) => Cart()));
            //   },
            //   child: ListTile(
            //     title: Text('Cart'),
            //     leading: Icon(Icons.shopping_cart),
            //   ),
            // ),
            // Divider(),
            // InkWell(
            //   onTap: () => Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => SettingsPage()),
            //   ),
            //   child: ListTile(
            //     title: Text('Settings'),
            //     leading: Icon(Icons.settings, color: Colors.blue),
            //   ),
            // ),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              ),
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
          new GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignIn()),
                );
              },
              child: Card(
                  margin: EdgeInsets.all(20),
                  child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Icon(Icons.arrow_drop_down_circle_outlined),
                            Text(
                              'See all products',
                              style: TextStyle(fontSize: 20),
                            ),
                          ]))))
        ],
      ),
    );
  }
}
