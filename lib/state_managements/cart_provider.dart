import 'package:flutter/material.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/product.dart';

class CartProvider with ChangeNotifier {
  final List<Cart> _items = <Cart>[];

  List<Cart> get items => _items;

  void addProduct(Product product, {int quantity = 1}) {
    _items.indexWhere((cart) => cart.product == product) != -1
    ? _items[_items.indexWhere((cart) => cart.product == product)].numOfItem += quantity
    : _items.add(Cart(product: product, numOfItem: quantity));
    notifyListeners();
  }

  void removeCart(Cart cart) {
    _items.removeWhere((cartItem) => cartItem.product.id == cart.product.id);
    notifyListeners();
  }
}