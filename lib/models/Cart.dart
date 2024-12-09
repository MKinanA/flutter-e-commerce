import 'product.dart';

class Cart {
  final Product product;
  int numOfItem;

  Cart({required this.product, this.numOfItem = 1});
}