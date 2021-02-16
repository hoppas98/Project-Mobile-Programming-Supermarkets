import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:otlobly/models/user.dart';
import 'package:otlobly/services/store.dart';

class ManageUsers extends StatefulWidget {
  @override
  _ManageUsersState createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Users'),
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
                  ));
                }
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTapUp: (details) {
                              double dx = details.globalPosition.dx;
                              double dy = details.globalPosition.dy;
                              double dx2 = MediaQuery.of(context).size.width;
                              double dy2 = MediaQuery.of(context).size.height;
                              showMenu(
                                  context: context,
                                  position:
                                      RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                                  items: [
                                    MyPopupMenuItem(
                                      child: Text('Edit'),
                                      onClick: () {
                                        Navigator.pushNamed(
                                          context,
                                          '/editUser',
                                          arguments: users[index],
                                        );
                                      },
                                    ),
                                  ]);
                            },
                            child: Stack(children: [
                              Positioned.fill(
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage('images/ProfileIcon.png'),
                                ),
                              ),
                              Text(
                                'Name: ${users[index].uName}',
                                textAlign: TextAlign.center,
                              ),
                              Positioned(
                                  bottom: 0,
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
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
                                            Text(
                                              users[index].uEmail,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(users[index].uType),
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

class MyPopupMenuItem<T> extends PopupMenuItem<T> {
  final Widget child;
  final Function onClick;
  MyPopupMenuItem({@required this.child, @required this.onClick})
      : super(child: child);
  PopupMenuItemState<T, PopupMenuItem<T>> createState() =>
      MyPopupMenuItemState();
}

class MyPopupMenuItemState<T, PopupMenuItem>
    extends PopupMenuItemState<T, MyPopupMenuItem<T>> {
  void handleTap() {
    widget.onClick();
  }
}
