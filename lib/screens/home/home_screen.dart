import 'package:flutter/material.dart';
import 'package:shop_app/screens/details/details_screen.dart';

import '../../components/product_card.dart';
import '../../models/product.dart';
import 'components/categories.dart';
import 'components/discount_banner.dart';
import 'components/home_header.dart';
import 'components/popular_product.dart';
import 'components/special_offers.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              HomeHeader(
                onSearchQueryChange: (query) => setState(() {
                  searchQuery = query;
                }),
              ),
              ... searchQuery != '' ? ((){
                final List<Product> productsToDisplay = [];
                for (Product product in demoProducts) {
                  if (
                    product.title.toLowerCase().contains(searchQuery.toLowerCase())
                    || product.id.toString() == searchQuery
                  ) {
                    productsToDisplay.add(product);
                  }
                }
                return [
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 20,
                    ),
                    itemCount: productsToDisplay.length,
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) => ProductCard(
                      product: productsToDisplay[index],
                      onPress: () => Navigator.pushNamed(
                        context,
                        DetailsScreen.routeName,
                        arguments:
                            ProductDetailsArguments(product: productsToDisplay[index]),
                      ),
                    ),
                  )
                ];
              })() : const [
                DiscountBanner(),
                Categories(),
                SpecialOffers(),
                SizedBox(height: 20),
                PopularProducts(),
                SizedBox(height: 20),
              ]

            ],
          ),
        ),
      ),
    );
  }
}
