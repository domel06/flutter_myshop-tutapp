import 'package:flutter/material.dart';
import 'package:myshop/screens/detailScreen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Consumer<Product>(
        builder: (ctx, product, child) => ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: GridTile(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(DetailScreen.namedRoute,
                        arguments: product.id);
                  },
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                footer: GridTileBar(
                  leading: IconButton(
                    icon: Icon(product.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border),
                    onPressed: () {
                      product.toogleIsFavorite();
                    },
                    color: Theme.of(context).accentColor,
                  ),
                  backgroundColor: Colors.black87,
                  title: Text(
                    product.title,
                    textAlign: TextAlign.center,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      cart.addItems(product.id, product.title, product.price);
                    },
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
            ));
  }
}
