import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// a scrolling parallax effect (horizontal)

class RowItemsWidget extends StatelessWidget {
  const RowItemsWidget({super.key});

  // Add to cart function
  void addToCartFunction() {}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 190,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: Product.products.length,
            itemBuilder: (context, index) {
              return ProductCard(product: Product.products[index]);
            }));
  }
}

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
      category: "Men's Shoes",
      img: "assets/1.png",
      price: 90,
    ),
    Product(
      name: 'Nike Shoes 2',
      category: "Men's Shoes",
      img: "assets/2.png",
      price: 40,
    ),
    Product(
      name: 'Nike Shoes 3',
      category: "Women's Shoes",
      img: "assets/3.png",
      price: 50,
    ),
    Product(
      name: 'Nike Shoes 4',
      category: "Women's Shoes",
      img: "assets/4.png",
      price: 120,
    ),
    Product(
      name: 'Nike Shoes 5',
      category: "Women's Shoes",
      img: "assets/5.png",
      price: 60,
    ),
    Product(
      name: 'Nike Shoes 6',
      category: "Men's Shoes",
      img: "assets/6.png",
      price: 80,
    ),
  ];
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          margin: EdgeInsets.only(top: 10, bottom: 10, left: 15),
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF475269).withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 1),
            ],
          ),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, right: 70),
                    height: 110,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Image.asset(
                    product.img,
                    height: 120,
                    width: 120,
                    fit: BoxFit.contain,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                          color: Color(0xFF475269),
                          fontSize: 23,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      product.category,
                      style: TextStyle(
                        color: Color(0xFF475269).withOpacity(0.8),
                        fontSize: 16,
                      ),
                    ),
                    // const Spacer(),
                    Row(
                      children: [
                        Text(
                          "\$${product.price}",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 70),
                        InkWell(
                          onTap: null,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFF475269),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              CupertinoIcons.cart_fill_badge_plus,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ))
    ]);
  }
}
