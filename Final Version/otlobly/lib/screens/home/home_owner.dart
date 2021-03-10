import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:otlobly/screens/wrapper.dart';
import 'package:otlobly/services/auth.dart';

class HomeOwner extends StatefulWidget {
  @override
  _HomeOwnerState createState() => _HomeOwnerState();
}

class _HomeOwnerState extends State<HomeOwner> {
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
    Map userData = ModalRoute.of(context).settings.arguments;
    String supermarketName = userData['userSuperMarketName'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Owner'),
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
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            imageCarousel,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/addProduct',
                      arguments: userData,
                    );
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
                  ),
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/manageProducts',
                        arguments: supermarketName,
                      );
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
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/viewProducts',
                        arguments: supermarketName,
                      );
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
          ],
        ),
      ),
    );
  }
}

// child: Column(
//   children: [
//     imageCarousel,
//     Container(
//       margin: EdgeInsets.all(1.0),
//       height: 100.0,
//       padding: EdgeInsets.symmetric(horizontal: 15),
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: [
//           Container(
//             child: Column(
//               children: [
//                 SizedBox(
//                   child: Column(
//                     children: [
//                       InkWell(
//                           onTap: () {
//                             Navigator.pushNamed(
//                               context,
//                               '/addProduct',
//                               arguments: supermarketName,
//                             );
//                           },
//                           child: Column(
//                             children: [
//                               Icon(
//                                 Icons.upload_file,
//                                 size: 50,
//                               ),
//                               Text(
//                                 'Upload a Product',
//                                 style: TextStyle(fontSize: 12.5),
//                               ),
//                             ],
//                           )),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             width: 15,
//           ),
//           Container(
//             child: Column(
//               children: [
//                 SizedBox(
//                   child: Column(
//                     children: [
//                       InkWell(
//                           onTap: () {
//                             Navigator.pushNamed(
//                               context,
//                               '/manageProducts',
//                               arguments: supermarketName,
//                             );
//                           },
//                           child: Column(
//                             children: [
//                               Icon(
//                                 Icons.edit,
//                                 size: 50,
//                               ),
//                               Text(
//                                 'Edit a Product',
//                                 style: TextStyle(fontSize: 12.5),
//                               ),
//                             ],
//                           )),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             width: 15,
//           ),
//           Container(
//             child: Column(
//               children: [
//                 SizedBox(
//                   child: Column(
//                     children: [
//                       InkWell(
//                           onTap: () {
//                             Navigator.pushNamed(
//                               context,
//                               '/viewProducts',
//                               arguments: supermarketName,
//                             );
//                           },
//                           child: Column(
//                             children: [
//                               Icon(
//                                 Icons.view_list,
//                                 size: 50,
//                               ),
//                               Text(
//                                 'View Products',
//                                 style: TextStyle(fontSize: 12.5),
//                               ),
//                             ],
//                           )),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             width: 15,
//           ),
//         ],
//       ),
//     ),
//   ],
// ),
//       ),
//     );
//   }
// }
