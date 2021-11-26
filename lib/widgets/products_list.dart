import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsp/providers/products_provider.dart';
import './product_item.dart';

class ProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final product_class = Provider.of<ProductsProvider>(context);
    final products = product_class.items;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value:  products[index],
        child: ProductItem(
        ),
      ),
    );
  }
}
