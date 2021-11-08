import 'package:flutter/material.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  static const namedRoute = '/detail-screen';
  // final String title;
  // DetailScreen(this.title);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProducts =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProducts.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            child: Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProducts.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text('\$${loadedProducts.price}'),
           SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text(loadedProducts.description,textAlign: TextAlign.center,softWrap: true,))
        ]),
      ),
    );
  }
}
