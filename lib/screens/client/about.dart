import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:otlobly/screens/client/constants.dart';
import 'package:otlobly/screens/client/detail_about.dart';

import 'data.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'About us',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 44,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      DropdownButton(
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              'Know us more',
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 24,
                                color: const Color(0x7cdbf1ff),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                        // icon: Padding(
                        //     padding: const EdgeInsets.only(left: 16.0),
                        //     child: Image.asset('assets/drop_down_icon.png')),
                        underline: SizedBox(),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 500,
                  padding: const EdgeInsets.only(left: 32),
                  child: Swiper(
                    itemCount: abouts.length,
                    itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                    layout: SwiperLayout.STACK,
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        activeSize: 20,
                        space: 3,
                      ),
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => DetailAbout(
                                aboutInfo: abouts[index],
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                SizedBox(height: 100),
                                Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(32.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(height: 100),
                                        Text(
                                          abouts[index].name,
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 44,
                                            color: const Color(0xff47455f),
                                            fontWeight: FontWeight.w900,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          'Otlobly FAQ',
                                          style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontSize: 23,
                                            color: primaryTextColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(
                                          height: 32,
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              'Know more',
                                              style: TextStyle(
                                                fontFamily: 'Avenir',
                                                fontSize: 18,
                                                color: secondaryTextColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                            Icon(
                                              Icons.arrow_forward,
                                              color: secondaryTextColor,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Image.asset(abouts[index].iconImage)
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
