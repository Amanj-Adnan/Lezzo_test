import 'package:flutter/foundation.dart';

class Shop with ChangeNotifier{
  final String id;
  final String shop;
  final String imgUrl;


  Shop({
    required this.id,
    required this.shop,
    required this.imgUrl,
  });


}

