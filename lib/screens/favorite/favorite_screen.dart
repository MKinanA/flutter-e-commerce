import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/state_managements/cart_provider.dart';
import '../../models/cart.dart';
import '../../models/product.dart';
import '../../state_managements/favorite_provider.dart';
import '../cart/components/cart_card.dart';
import '../details/details_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              "Your Favorites",
            ),
            Text(
              "${context.watch<FavoriteProvider>().items.length} items",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<FavoriteProvider>(
          builder: (context, favoriteProvider, _) => ListView.builder(
            itemCount: favoriteProvider.items.length,
            itemBuilder: (context, index) {
              final Product product = favoriteProvider.items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Slidable(
                  key: Key(product.id.toString()),
                  endActionPane:ActionPane(motion: const ScrollMotion(), children: [
                    SlidableAction(
                      onPressed: (context) {
                        context.read<CartProvider>().addProduct(product);
                        context.read<FavoriteProvider>().removeItem(product);
                        Navigator.pushNamed(context, CartScreen.routeName);
                      },
                      icon: Icons.shopping_cart,
                      label: 'Cart',
                      padding: const EdgeInsets.all(10),
                      backgroundColor: kPrimaryColor,
                    ),
                    SlidableAction(
                      onPressed: (context) {
                        context.read<FavoriteProvider>().items.contains(product)
                        ? context.read<FavoriteProvider>().removeItem(product)
                        : context.read<FavoriteProvider>().addItem(product);
                      },
                      icon: Icons.delete,
                      label: 'Delete',
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.red,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ]),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, DetailsScreen.routeName, arguments: ProductDetailsArguments(
                        product: product
                      ));
                    },
                    child: LayoutBuilder(
                      builder: (context, constraints) => SizedBox(
                        width: constraints.maxWidth,
                        child: CartCard(cart: Cart(product: product), showNumOfItem: false)
                      )
                    ),
                  ),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
