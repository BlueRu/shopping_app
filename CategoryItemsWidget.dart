import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Product.dart';

// 4 Item image below the scrolling row image
class CategoryItemsWidget extends StatelessWidget {
  const CategoryItemsWidget({
    required this.category,
    super.key,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    List<Product> homeProduct = Product.products
        .where((products) => products.category == category)
        .toList();
    if (category == "All") {
      homeProduct = Product.products;
    }
    return GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 0.68,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        children: List.generate(
            homeProduct.length,
            (index) => CategoryCard(
                  product: homeProduct[index],
                )));
  }
}

class CategoryCard extends StatelessWidget {
  final Product product;
  const CategoryCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 0.68,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      children: [
        Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF475269).withOpacity(0.3),
                  blurRadius: 5,
                  spreadRadius: 1,
                )
              ],
            ),
            child: Column(children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "itemPage");
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    product.img,
                    height: 130,
                    width: 130,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(product.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF475269),
                        ))),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "New Nike Shoes For Men",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF475269).withOpacity(0.7),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.redAccent),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        CupertinoIcons.cart_fill_badge_plus,
                        color: Colors.white,
                        size: 28,
                      ),
                    )
                  ],
                ),
              )
            ])),
      ],
    );
  }
}
