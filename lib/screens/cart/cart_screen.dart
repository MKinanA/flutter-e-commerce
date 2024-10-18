import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import '../../models/cart.dart';
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
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "${demoCarts.fold<int>(0, (previousValue, cart) => previousValue + cart.numOfItem)} items",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: demoCarts.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(demoCarts[index].product.id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  demoCarts.removeAt(index);
                });
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
                    product: demoCarts[index].product
                  ));
                },
                child: LayoutBuilder(
                  builder: (context, constraints) => SizedBox(
                    width: constraints.maxWidth,
                    child: CartCard(cart: demoCarts[index])
                  )
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: CheckoutCard(
        total: demoCarts.fold(0, (prev, cart) => prev + (cart.product.price * cart.numOfItem))
      ),
    );
  }
}
