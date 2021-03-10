import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/cart.dart';
import 'package:provider/provider.dart' as provider;
import 'package:http/http.dart' as http;

import '../models/orders.dart' show Orders;
import '../components/order_item.dart';
import '../components/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = provider.Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
        backgroundColor: Colors.red,
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (ctx, i) => OrderItem(orderData.orders[i]),
      ),
    );
  }
}
