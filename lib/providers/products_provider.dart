import 'package:flutter/material.dart';
import 'product.dart';
import './data.dart';
class ProductsProvider with ChangeNotifier{
    List <Product>  _items = [
      ...Data().data
    ];




    var _show = '' ;
    var _name = '' ;
    List<Product> get items {
      if (_show == 'clothes'){
        return _items.where((element) => element.category == 'clothes' && element.shop==_name).toList();
      } else if (_show == 'shoes'){
        return _items.where((element) => element.category == 'shoes'&& element.shop==_name).toList();
      } else if (_show == 'others'){
        return _items.where((element) => element.category == 'others' && element.shop==_name).toList();
      }else if(_show == 'all'){
        return _items.where((element) =>  element.shop==_name).toList();
      }else{
        return _items.where((element) =>  element.shop==_name).toList();
      }
      return[..._items];
    }

    Product findById(String id){
      return _items.firstWhere((element) => element.id == id);
    }



    void categorey(data , name){
      _show = data ;
      _name = name;
      notifyListeners();
    }

}