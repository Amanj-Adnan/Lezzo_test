import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {


 final  Map <String, CartItem> _items ={};


  Map<String, CartItem> get items {
    return {..._items};
  }

  int get totalItem {
    return  _items.length;
  }
  double get totalPrice {
    var t = 0.0;
    _items.forEach((key, cartItem) {
      t += cartItem.price * cartItem.quantity;
    });
    return t ;
  }

  void deleteItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }
  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              quantity: value.quantity + 1,
              price: value.price));
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1),
      );
    }
    notifyListeners();
  }
}
