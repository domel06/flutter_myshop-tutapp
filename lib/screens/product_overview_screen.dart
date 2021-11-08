import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myshop/screens/cartScreen.dart';
import 'package:myshop/widget/app_drawer.dart';
import 'package:myshop/widget/products_grid.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../widget/badge.dart.dart';
import './cartScreen.dart';

enum filterOptions { favorites, all }

class ProductOverViewScreen extends StatefulWidget {
  @override
  _ProductOverViewScreenState createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('myShop'),
        actions: <Widget>[
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (filterOptions selectedValue) {
                setState(() {
                  if (selectedValue == filterOptions.favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('only favorites'),
                      value: filterOptions.favorites,
                    ),
                    PopupMenuItem(
                      child: Text('Show all'),
                      value: filterOptions.all,
                    )
                  ]),
          Consumer<Cart>(
            builder: (context, cartData, ch) =>
                Badge(child: ch, value: cartData.itemCount.toString()),
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                }),
          )
        ],
      ),
      drawer:AppDrawer() ,
      body: ProductGrid(_showOnlyFavorites),
    );
  }
}
