import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
      {"icon": "assets/icons/Discover.svg", "text": "More"},
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
            ...List.generate(
              (categories.length * 2) - 1,
              (index) => index % 2 == 0 ? CategoryCard(
                icon: categories[index ~/ 2]["icon"],
                text: categories[index ~/ 2]["text"],
                press: () {},
              ) : const SizedBox(width: 16),
            ),
            const SizedBox(width: 20)
          ]
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 64,
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                height: constraints.maxWidth,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  color: /*const Color(0xFFFFECDF)*/ kPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  icon,
                  colorFilter: const ColorFilter.mode(
                    kPrimaryColor,
                    BlendMode.srcIn
                  )
                )
              ),
              const SizedBox(height: 4),
              Text(
                text,
                textAlign: TextAlign.center
              )
            ],
          ),
        ),
      ),
    );
  }
}
