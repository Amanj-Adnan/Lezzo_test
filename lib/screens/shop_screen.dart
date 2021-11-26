import 'package:flutter/material.dart';
import 'package:tsp/widgets/shop_list.dart';
class ShopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('shops'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ShopList(),
    );
  }
}
