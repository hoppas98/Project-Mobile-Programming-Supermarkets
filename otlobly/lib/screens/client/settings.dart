import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class SettingsPage extends StatefulWidget{
  @override
  _SettingsPageState createState()=>_SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>{
  //bool isActive=true;
  bool value4=false;
  bool value5=true;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.red,
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16,top: 25,right: 16),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.red,
                  ),
                  SizedBox(width:8,),
                  Text(
                    "Account",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  )
              ],
            ),
            Divider(
              height:15,
              thickness: 2,
              ),
              SizedBox(
                height:10,
              ),
              buildAccountOptionRow(context,"Change Password"),
              //buildAccountOptionRow(context,"Language"),
              //buildAccountOptionRow(context,"Privacy and Security"),
               SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.red,
                  ),
                  SizedBox(width:8,),
                  Text(
                    "Notifications",
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  )
              ],
            ),
            Divider(
              height:15,
              thickness: 2,
              ),
              SizedBox(
                height:10,
              ),
               buildNotificationOptionRow("New for you"),
               buildNotificationOptionRow("Account Activity"),
              //buildNotificationOptionRow("Dark Mode"),
              Center(
                child: OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal:60),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  onPressed: (){},
                  child: Text(
                    "SIGN OUT",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 2.2,
                      color: Colors.red
                      )
                      ),
                    ),
              ),
          ],
        ),
      ),
    );
  }

  void onChangedValue4(bool value){
    setState(() {
      value4=value;
    });
  }
  void onChangedValue5(bool value){
    setState(() {
      value5=value;
    });
  }
  Row buildNotificationOptionRow(String title) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,color: Colors.grey[600],
                ),
                ),
                Transform.scale(
                  scale: 0.7,
                  child: Switch(
                    value: value4,
                     onChanged: onChangedValue4,
                     activeColor: Colors.red,
                     ),
                      
                  // Column(
                  //    SwitchListTile(
                  //      value: value5,
                  //       onChanged: onChangedValue5
                  //       ),
                  //       ),
                  // child: Switch(
                  //   value: isActive,
                  //    onChanged: (bool val){
                  //      setState(() {
                  //        isActive=val;
                  //        //isActive=!isActive;
                  //        print(isActive);
                  //      });
                  //    },
                  //    )
                     )
              ],
              
            );
            
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
              onTap: (){
                showDialog
                (context: context,
                builder: (BuildContext context){
                  return AlertDialog(
                    title: Text(title),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child:SingleChildScrollView(
                            child: Column(
                              children:[
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Current password'),
                        ),
                          SizedBox(
                            height: 10,
                          ),
                        SizedBox(
                            height: 10,
                          ),
                        TextFormField(
                          decoration: InputDecoration(hintText: 'New password'),
                        ),
                          SizedBox(
                            height: 10,
                          ),
                        SizedBox(
                            height: 10,
                          ),
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Confirm new password'),
                        ),
                          SizedBox(
                            height: 10,
                          ),
                        SizedBox(
                            height: 10,
                          ),
                      ])))],
                    ),
                    actions: [
                      FlatButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                      },
                       child: Text("Close", style: TextStyle(
                         color: Colors.red
                       ),
                       ))],
                  );
                }
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical:8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                     style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                ],
              ),
            ));
  }
}