import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsp/providers/cart.dart';
import '../widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Chip(
                    label: Text(
                      '\$${cart.totalPrice} ',
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.indigoAccent.shade100,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'ORDER',
                      style: TextStyle(color: Colors.indigoAccent),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.totalItem,
              itemBuilder: (context, index) => CartItemWidget(
                  id: cart.items.values.toList()[index].id,
                  prodId: cart.items.keys.toList()[index],
                  title: cart.items.values.toList()[index].title,
                  quantity: cart.items.values.toList()[index].quantity,
                  price: cart.items.values.toList()[index].price),
            ),
          )
        ],
      ),
    );
  }
}
