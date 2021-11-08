import 'dart:math';

import 'package:flutter/material.dart';
import '../providers/orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem({this.order});

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(children: <Widget>[
        ListTile(
          title: Text('\$${widget.order.ammount}'),
          subtitle: Text(
            DateFormat('dd MM yyyy hh:mm').format(widget.order.dateTime),
          ),
          trailing: IconButton(
            icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
            onPressed: () {
              setState(() {
                _expanded = !_expanded;
              });
            },
          ),
        ),
        if (_expanded)
          Container(
            height: min(widget.order.products.length * 20.0 + 100, 180),
            child: ListView(
              children: widget.order.products
                  .map((e) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                        children: <Widget>[
                          Text(
                            e.title,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('${e.quantity}x\$${e.price}',style: TextStyle(fontSize: 18,color: Colors.grey),)
                        ],
                      ))
                  .toList(),
            ),
          )
      ]),
    );
  }
}
