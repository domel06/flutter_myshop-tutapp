import 'package:flutter/material.dart';
import 'package:myshop/screens/user_productScreen.dart';
import '../screens/order_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello friend'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
           ListTile(
            leading: Icon(Icons.shop),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrderScreen.namedRoute);
            },
          ),
           Divider(),
           ListTile(
            leading: Icon(Icons.shop),
            title: Text('Products'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(UserProductScreen.namedRoute);
            },
          ),

        ],
      ),
    );
  }
}
