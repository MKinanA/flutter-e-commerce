import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Product> _items = <Product>[];

  List<Product> get items => _items;

  void addItem(Product product, {int quantity = 1}) {
    _items.indexWhere((theProduct) => theProduct == product) != -1
    ? null
    : _items.add(product);
    notifyListeners();
  }

  void removeItem(Product product) {
    _items.removeWhere((theProduct) => theProduct.id == product.id);
    notifyListeners();
  }
}