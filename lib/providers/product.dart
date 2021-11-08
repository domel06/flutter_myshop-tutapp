import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String title;
  final String id;
  final double price;
  final String description;
  final String imageUrl;
  bool isFavourite;

  void toogleIsFavorite() {
    isFavourite = !isFavourite;
    notifyListeners();
  }

  Product(
      {@required this.title,
      @required this.id,
      @required this.price,
      @required this.description,
      @required this.imageUrl,
      this.isFavourite = false});
}
