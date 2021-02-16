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
                              Text(
                                'Name: ${users[index].uName}',
                                textAlign: TextAlign.center,
                              ),
                              Positioned(
                                  bottom: 0,
                                  width: MediaQuery.of(context).size.width,
                                  height: 75,
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
                                            Text(
                                                'User ID: ${users[index].uid}'),
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

// void initState() {
//   getProducts();
// }

// void getProducts() async {
//   _products = await _store.loadProducts();
// }
