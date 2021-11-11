import 'package:flutter/material.dart';
import 'package:myshop/widget/app_drawer.dart';
import 'package:myshop/widget/user-product_list.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class UserProductScreen extends StatelessWidget {
  static const namedRoute = '/products';

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage products'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                //navigate to add product
              })
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (ctx, i) => Column(
            children:[
              UserProductList(
                title: products.items[i].title,
                imageUrl: products.items[i].imageUrl),
                Divider()
            ]),
          itemCount: products.items.length,
        ),
      ),
    );
  }
}