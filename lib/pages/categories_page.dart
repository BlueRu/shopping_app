import 'package:flutter/material.dart';
import 'package:message_board_app/widgets/CategoryItemsWidget.dart';
import 'package:message_board_app/widgets/RowItemsWidget.dart';
import 'package:message_board_app/widgets/Product.dart' as prefix;

const List<Tab> tabs = <Tab>[
  Tab(text: 'All'),
  Tab(text: 'Men'),
  Tab(text: 'Women'),
];

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Product> categoryProduct = Product.products;
    return DefaultTabController(
        length: categoryProduct.length,
        child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(text: "All"),
                  Tab(text: "Women"),
                  Tab(text: "Men"),
                ],
              ),
              title: const Text('Categories'),
            ),
            body: TabBarView(
              children: [
                CategoryItemsWidget(category: "All"),
                CategoryItemsWidget(category: "Women"),
                CategoryItemsWidget(category: "Men"),
              ],
            )));
  }
}
