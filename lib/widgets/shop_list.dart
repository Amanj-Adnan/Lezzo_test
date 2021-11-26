import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsp/providers/shops_provider.dart';
import 'package:tsp/widgets/shop_item.dart';
class ShopList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shopClass = Provider.of<ShopsProvider>(context);
    final shops = shopClass.shops;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      padding: const EdgeInsets.all(10.0),
      itemCount: shops.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value:  shops[index],
        child: ShopItem(),
      ),
    );
  }
}
