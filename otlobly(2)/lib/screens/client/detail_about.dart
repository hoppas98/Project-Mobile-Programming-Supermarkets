import 'package:flutter/material.dart';
import 'package:otlobly/screens/client/constants.dart';
import 'package:otlobly/screens/client/data.dart';

class DetailAbout extends StatelessWidget {
  final AboutInfo aboutInfo;
  const DetailAbout({Key key,this.aboutInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
                          child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:<Widget>[
                        SizedBox(height: 300),
                        Text(
                          'Services',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 56,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                          ),
                          Text(
                            'Otlobly Utilities',
                            style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 31,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                          ),
                          Divider(color:Colors.black38),
                          SizedBox(height:32),
                          Text(
                            aboutInfo.description ?? '',
                            maxLines: 8,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 20,
                              color: contentTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height:32),
                          Divider(color:Colors.black38),
                          ],
                    ),
                  ),
                  
                ],
              ),
            ),
            Positioned(
              top: -130,
              right: -160,
            child:Image.asset(aboutInfo.iconImage),
            ),
            Positioned(
              top: 60,
              child: Text(
                aboutInfo.position.toString(),
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 247,
                  color: primaryTextColor.withOpacity(0.09),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_back),
                 onPressed: (){
                   Navigator.pop(context);
                 }
                 ),
            ],
        ),
      ),
    );
  }
}