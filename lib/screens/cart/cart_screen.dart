import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/state_managements/cart_provider.dart';
import 'components/cart_card.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            const Text(
              "Your Cart",
            ),
            Text(
              "${context.watch<CartProvider>().items./*fold<int>(0, (previousValue, cart) => previousValue + cart.numOfItem)*/length} items",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Consumer<CartProvider>(
          builder: (context, cartProvider, _) => ListView.builder(
            itemCount: cartProvider.items.length,
            itemBuilder: (context, index) {
              final Cart cart = cartProvider.items[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(cart.product.id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    cartProvider.removeCart(cart);
                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        SvgPicture.asset("assets/icons/Trash.svg"),
                      ],
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, DetailsScreen.routeName, arguments: ProductDetailsArguments(
                        product: cart.product
                      ));
                    },
                    child: LayoutBuilder(
                      builder: (context, constraints) => SizedBox(
                        width: constraints.maxWidth,
                        child: CartCard(cart: cart)
                      )
                    ),
                  ),
                ),
              );
            }
          ),
        ),
      ),
      bottomNavigationBar: CheckoutCard(
        total: context.watch<CartProvider>().items.fold(0, (prev, cart) => prev + (cart.product.price * cart.numOfItem))
      ),
    );
  }
}
