import 'package:flutter/material.dart';
import 'package:myshop/widget/app_drawer.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart' show Order;
import '../widget/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const namedRoute = '/order';
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Order>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Order'),
        ),
        drawer: AppDrawer(),
        body: Card(
          margin: EdgeInsets.all(10),
          child: ListView.builder(
            itemBuilder: (ctx, i) => OrderItem(
              order: orders.orders[i],
            ),
            itemCount: orders.orders.length,
          ),
        ));
  }
}
