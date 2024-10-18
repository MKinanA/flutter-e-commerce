import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      Colors.white,
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: dummyDescription,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    colors: [
      Colors.white,
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: dummyDescription,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      Colors.black,
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: dummyDescription,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Colors.black,
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 20.20,
    description: dummyDescription,
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    id: 5,
    images: [
      'assets/images/man.jpeg',
      'assets/images/man.jpeg',
      'assets/images/man.jpeg',
      'assets/images/man.jpeg',
      'assets/images/man.jpeg',
      'assets/images/man.jpeg',
      'assets/images/man.jpeg',
      'assets/images/man.jpeg'
    ],
    colors: [
      Colors.black
    ],
    title: '<insert_name>',
    price: 0.00,
    description: dummyDescription
  )
];

const String dummyDescription = '''No problem! Here's the information about the Mercedes CLR GTR:

The Mercedes CLR GTR is a remarkable racing car celebrated for its outstanding performance and sleek design. Powered by a potent 6.0-liter V12 engine, it delivers over 600 horsepower.

Acceleration from 0 to 100 km/h takes approximately 3.7 seconds, with a remarkable top speed surprising 320 km/h.🥇

Incorporating adventure aerodynamic features and cutting-edge stability technologies, the CLR GTR ensures exceptional stability and control, particularly during high-speed maneuvers. 💨

Originally priced at around \$1.5 million, the Mercedes CLR GTR is considered one of the most exclusive and prestigious racing cars ever produced. 💰

Its limited production run of just five units adds to its rarity, making it highly sought after by racing enthusiasts and collectors worldwide. 🌎''';
