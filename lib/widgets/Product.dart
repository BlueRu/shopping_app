import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String img;
  final double price;

  const Product({
    required this.name,
    required this.category,
    required this.img,
    required this.price,
  });

  @override
  List<Object?> get props => [name, category, img, price];

  static List<Product> products = [
    Product(
      name: 'Nike Shoes 1',
      category: "Men",
      img: "assets/1.png",
      price: 90,
    ),
    Product(
      name: 'Nike Shoes 2',
      category: "Men",
      img: "assets/2.png",
      price: 40,
    ),
    Product(
      name: 'Nike Shoes 3',
      category: "Women",
      img: "assets/3.png",
      price: 50,
    ),
    Product(
      name: 'Nike Shoes 4',
      category: "Women",
      img: "assets/4.png",
      price: 120,
    ),
    Product(
      name: 'Nike Shoes 5',
      category: "Women",
      img: "assets/5.png",
      price: 60,
    ),
    Product(
      name: 'Nike Shoes 6',
      category: "Men",
      img: "assets/6.png",
      price: 80,
    ),
  ];
}
