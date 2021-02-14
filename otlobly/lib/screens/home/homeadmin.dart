import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:otlobly/screens/admin/display_products.dart';
import 'package:otlobly/screens/admin/manage_product.dart';
import 'package:otlobly/screens/admin/addProducts.dart';
import 'package:otlobly/screens/admin/view_orders.dart';
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
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(1.0),
              height: 100.0,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          child: Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddProduct()));
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.upload_file,
                                        size: 50,
                                      ),
                                      Text(
                                        'Upload a Product',
                                        style: TextStyle(fontSize: 12.5),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          child: Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Editproduct()));
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        size: 50,
                                      ),
                                      Text(
                                        'Edit a Product',
                                        style: TextStyle(fontSize: 12.5),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          child: Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ViewProducts()));
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.view_list,
                                        size: 50,
                                      ),
                                      Text(
                                        'View Products',
                                        style: TextStyle(fontSize: 12.5),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewOrders()));
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.inbox_outlined,
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
                  ),
                ],
              ),
            ),
            imageCarousel,
          ],
        ),
      ),
    );
  }
}

//  Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: Container(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         imageCarousel,
//         Container(
//           width: 275,
//           child: GridView.count(
//             crossAxisCount: 2,
//             crossAxisSpacing: 15.0,
//             mainAxisSpacing: 15.0,
//             shrinkWrap: true,
//             children: [
//               SizedBox(
//                 child: RaisedButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => AddProduct()));
//                   },
//                   color: Colors.red,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(18.0),
//                       side: BorderSide(color: Colors.red)),
//                   child: Text('ADD PRODUCT'),
//                 ),
//               ),
//               SizedBox(
//                 width: 15,
//                 child: RaisedButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ViewProducts()));
//                   },
//                   color: Colors.red,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(18.0),
//                       side: BorderSide(color: Colors.red)),
//                   child: Center(child: Text('VIEW PRODUCTS')),
//                 ),
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 child: RaisedButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ViewProducts()));
//                   },
//                   color: Colors.red,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(18.0),
//                       side: BorderSide(color: Colors.red)),
//                   child: Text(
//                     'VIEW EDIT/DELETE',
//                     style: TextStyle(
//                       fontSize: 11,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 child: RaisedButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => ViewOrders()));
//                   },
//                   color: Colors.red,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(18.0),
//                       side: BorderSide(color: Colors.red)),
//                   child: Text(
//                     'VIEW ORDERS',
//                     style: TextStyle(
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
