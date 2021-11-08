import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;
import '../widget/cartItem.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your cart'),
      ),
      body: Column(children: <Widget>[
        Card(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Chip(
                  label: Text('\$${cartData.totalAmount}',
                      style: TextStyle(
                        color: Theme.of(context).primaryTextTheme.title.color,
                      )),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                FlatButton(
                  onPressed: () {
                    Provider.of<Order>(context, listen: false).addOrder(
                        cartData.items.values.toList(), cartData.totalAmount);
                    cartData.clearCart();
                  },
                  child: Text('Order Now'),
                  textColor: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (ctx, i) => CartItem(
              id: cartData.items.values.toList()[i].id,
              productId: cartData.items.keys.toList()[i],
              title: cartData.items.values.toList()[i].title,
              price: cartData.items.values.toList()[i].price,
              quantity: cartData.items.values.toList()[i].quantity),
          itemCount: cartData.items.length,
        ))
      ]),
    );
  }
}
