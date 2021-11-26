import 'package:flutter/foundation.dart';

class Product with ChangeNotifier{
  final String id;
  final String title;
  final String body;
  final String category;
  final String shop;
  final double price;
  final String imgUrl;


  Product({
    required this.id,
    required this.title,
    required this.body,
    required this.category,
    required this.shop,
    required this.price,
    required this.imgUrl,

});


}

