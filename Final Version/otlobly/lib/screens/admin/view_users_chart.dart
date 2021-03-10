import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:otlobly/screens/wrapper.dart';
import 'package:otlobly/services/auth.dart';
import 'package:otlobly/services/store.dart';

class ViewUsersChart extends StatefulWidget {
  @override
  _ViewUsersChartState createState() => _ViewUsersChartState();
}

class _ViewUsersChartState extends State<ViewUsersChart> {
  final AuthService _auth = AuthService();
  var usersRef = Firestore.instance.collection('Users');
  final _store = Store();

  List<PieChartSectionData> _sections = List<PieChartSectionData>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
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
      body: StreamBuilder<QuerySnapshot>(
          stream: _store.loadUsers(),
          builder: (context, snapshot) {
            double countClients = 0;
            double countAdmins = 0;
            double countOwners = 0;
            double avgClients = 0;

            double avgAdmins = 0;
            double avgOwners = 0;
            if (snapshot.hasData) {
              for (var doc in snapshot.data.documents) {
                var data = doc.data;
                if (doc.data['UserType'] == 'Client') {
                  countClients = countClients + 1;
                  print('Clients: $countClients');
                } else if (doc.data['UserType'] == 'Admin') {
                  countAdmins = countAdmins + 1;
                  print('Admins: $countAdmins');
                } else if (doc.data['UserType'] == 'Owner') {
                  countOwners = countOwners + 1;
                  print('Owners: $countOwners');
                }
              }
              avgAdmins = countAdmins * 100;
              avgClients = countClients * 100;
              avgOwners = countOwners * 100;

              PieChartSectionData _item1 = PieChartSectionData(
                  color: Colors.blueAccent,
                  value: avgAdmins,
                  title: '$countAdmins',
                  radius: 50,
                  titleStyle: TextStyle(color: Colors.white, fontSize: 24));
              PieChartSectionData _item2 = PieChartSectionData(
                  color: Colors.redAccent,
                  value: avgOwners,
                  title: '$countOwners',
                  radius: 50,
                  titleStyle: TextStyle(color: Colors.white, fontSize: 24));
              PieChartSectionData _item3 = PieChartSectionData(
                  color: Colors.purpleAccent,
                  value: avgClients,
                  title: '$countClients',
                  radius: 50,
                  titleStyle: TextStyle(color: Colors.white, fontSize: 24));

              _sections = [
                _item1,
                _item2,
                _item3,
              ];
              return Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: PieChart(
                        PieChartData(sections: _sections),
                      ),
                    ),
                    Text(
                      'Description',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.blueAccent,
                          size: 75,
                        ),
                        Text('Admin(s)'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.redAccent,
                          size: 75,
                        ),
                        Text('Owner(s)'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.purpleAccent,
                          size: 75,
                        ),
                        Text('Client(s)'),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: Text('Loading'));
            }
          }),
    );
  }
}
