import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:otlobly/models/user.dart';
import 'package:otlobly/services/store.dart';

class ViewUsers extends StatefulWidget {
  @override
  _ViewUsersState createState() => _ViewUsersState();
}

class _ViewUsersState extends State<ViewUsers> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('View Users'),
          backgroundColor: Colors.red,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _store.loadUsers(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<User> users = [];
                for (var doc in snapshot.data.documents) {
                  var data = doc.data;

                  users.add(User(
                    uid: doc.documentID,
                    uName: data['UserName'],
                    uEmail: data['UserEmail'],
                    uPassword: data['UserPassword'],
                    uAddress: data['UserAddress'],
                    uType: data['UserType'],
                    uMobile: data['UserMobile'],
                    uSuperMarketName: data['UserSuperMarketName'],
                  ));
                }

                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: Stack(children: [
                              Positioned.fill(
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage('images/ProfileIcon.png'),
                                ),
                              ),
                              Text('${users[index].uName}',
                                  textAlign: TextAlign.center,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Positioned(
                                  bottom: 0,
                                  width: MediaQuery.of(context).size.width,
                                  height: 100,
                                  child: Opacity(
                                    opacity: 0.75,
                                    child: Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text('ID: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(users[index].uid),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text('Email: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(
                                                  users[index].uEmail,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Type: ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(users[index].uType),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text('Mobile: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text(users[index].uMobile),
                                              ],
                                            ),
                                            Visibility(
                                              visible: (users[index].uType ==
                                                  'Owner'),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Supermarket Name: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                      '${users[index].uSuperMarketName}'),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))
                            ]),
                          ),
                        ),
                    itemCount: users.length);
              } else {
                return Center(child: Text('Loading'));
              }
            }));
  }
}
