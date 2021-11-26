import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsp/providers/cart.dart';
import 'package:tsp/providers/products_provider.dart';
import 'package:tsp/screens/cart_screen.dart';
import '../widgets/products_list.dart';
import '../widgets/badge.dart.dart';

enum Filter {
  All,
  Clothes,
  Shoes,
  Others,
}

class ProductOverviewScreen extends StatelessWidget {
  static const routeName = '/products';
  @override
  Widget build(BuildContext context) {

    final productsStatus = Provider.of<ProductsProvider>(context);
    final shopName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lezzo Test'),
          backgroundColor: Theme.of(context).primaryColor,
          actions: [
            PopupMenuButton(
              onSelected: (Filter selectedValue) {
                if (selectedValue == Filter.Clothes) {
                  productsStatus.categorey('clothes' , shopName);
                } else if (selectedValue == Filter.Shoes) {
                  productsStatus.categorey('shoes' , shopName);
                } else if (selectedValue == Filter.Others) {
                  productsStatus.categorey('others' , shopName);
                } else {
                  productsStatus.categorey('all' , shopName);
                }
                print(selectedValue);
              },
              icon: const Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                const PopupMenuItem(
                  child: Text('All'),
                  value: Filter.All,
                ),
                const PopupMenuItem(
                  child: Text('Clothes'),
                  value: Filter.Clothes,
                ),
                const PopupMenuItem(
                  child: Text('Shoes'),
                  value: Filter.Shoes,
                ),
                const PopupMenuItem(
                  child: Text('Others'),
                  value: Filter.Others,
                ),
              ],
            ),
            Flexible(
              child: Consumer<Cart>(
                builder: (context,cart,_) =>  Badge(
                  child: IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                  ),
                  value: cart.totalItem.toString(),
                  color: Colors.red,
                ),

              ),
            )
          ],
        ),
        body: ProductsList());
  }
}
