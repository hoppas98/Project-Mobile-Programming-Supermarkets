import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:otlobly/models/orders.dart';
import 'package:otlobly/services/store.dart';

class ViewOrders extends StatefulWidget {
  @override
  _ViewOrdersState createState() => _ViewOrdersState();
}

class _ViewOrdersState extends State<ViewOrders> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        backgroundColor: Colors.red,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _store.loadOrders(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<OrderItem> orders = [];
              for (var doc in snapshot.data.documents) {
                var data = doc.data;
                /*orders.add(OrderItem(
                 /* userEmail: data['userEmail'],
                  orderID: doc.documentID,
                  userMobile: data['userMobile'],
                  userOrder: data['userOrder'],
                  userLocation: data['userLocation'],
                  userName: data['userName'],
                  totalPrice: data['totalPrice'],
                  createdAt: data['createdAt'],*/
                ));*/
              }
              return ListView.builder(
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.grey[300],
                          child: Column(
                            children: [
                              Container(
                                child: Opacity(
                                  opacity: 0.5,
                                  child: Container(
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Order No: #',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.5,
                                                ),
                                              ),
                                              Text(
                                                '${index + 1}',
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Name: ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.5,
                                                ),
                                              ),
                                              /*  Text(
                                                orders[index].userName,
                                              ),*/
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Email: ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.5,
                                                ),
                                              ),
                                              //  Text(orders[index].userEmail)
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Mobile: ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.5,
                                                ),
                                              ),
                                              //  Text(orders[index].userMobile)
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Location: ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.5,
                                                ),
                                              ),
                                              //  Text(orders[index].userLocation)
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Order: ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.5,
                                                ),
                                              ),
                                              // Text(orders[index].userOrder)
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Total Price: ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.5,
                                                ),
                                              ),
                                              // Text('EGP ' + orders[index].totalPrice)
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                'Created at: ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.5,
                                                ),
                                              ),
                                              // Text(orders[index].createdAt),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  IconButton(
                                                      icon: Icon(Icons.clear),
                                                      onPressed: () {
                                                        print('Order deleted');

                                                        // _store.deleteOrder(
                                                        //  orders[index]
                                                        //    .orderID);
                                                        // Navigator.pop(context);
                                                      }),
                                                  IconButton(
                                                      icon: Icon(Icons
                                                          .check_circle_outline_outlined),
                                                      onPressed: () {})
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                  itemCount: orders.length);
            } else {
              return Center(child: Text('Loading'));
            }
          }),
    );
  }
}
