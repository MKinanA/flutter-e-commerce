import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../state_managements/cart_provider.dart';
import '../../cart/cart_screen.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  final Function(String)? onSearchQueryChange;

  const HomeHeader({
    Key? key,
    this.onSearchQueryChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SearchField(
              onChanged: onSearchQueryChange
            ),
          ),
          const SizedBox(width: 16),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            numOfitem: context.watch<CartProvider>().items./*fold<int>(0, (previousValue, cart) => previousValue + cart.numOfItem)*/length,
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          const SizedBox(width: 8),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 9,
            press: () {},
          ),
        ],
      ),
    );
  }
}
