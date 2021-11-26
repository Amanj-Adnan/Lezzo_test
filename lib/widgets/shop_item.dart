import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsp/providers/products_provider.dart';
import 'package:tsp/providers/shop.dart';
import 'package:tsp/screens/products_overview_screen.dart';
class ShopItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shop = Provider.of<Shop>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GridTile(
        child: GestureDetector(
          child: Image.network(
            shop.imgUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            Provider.of<ProductsProvider>(context , listen: false).categorey('', shop.shop);
            Navigator.of(context).pushNamed(
              ProductOverviewScreen.routeName,
              arguments: shop.shop,
            );
          },
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,

          title: Text(
            shop.shop,
            textAlign: TextAlign.center,
          ),

        ),
      ),
    );
  }
}
