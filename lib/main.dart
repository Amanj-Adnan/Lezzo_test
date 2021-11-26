import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tsp/providers/shop.dart';
import 'package:tsp/providers/shops_provider.dart';
import 'package:tsp/screens/cart_screen.dart';
import 'package:tsp/screens/shop_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products_provider.dart';
import './providers/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductsProvider(),
        ),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: ShopsProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.indigo.shade800,
          accentColor: Colors.indigoAccent.shade200,
//        backgroundColor: Colors.grey.shade200
        ),
        home: ShopScreen(),
        routes: {
          ProductOverviewScreen.routeName: (context) => ProductOverviewScreen(),
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context)=> CartScreen(),
        },
      ),
    );
  }
}
