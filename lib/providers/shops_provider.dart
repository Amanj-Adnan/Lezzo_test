import 'package:flutter/foundation.dart';
import 'package:tsp/providers/shop.dart';

class ShopsProvider with ChangeNotifier {
     List<Shop> _shops = [
    Shop(
      id: '1',
      shop: 'lezzo',
      imgUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwFHQcp878uE9EOfpVM6Mw_DST5do0owy7pg&usqp=CAU',
    ),
    Shop(
      id: '2',
      shop: 'bazar',
      imgUrl:
      'https://i0.wp.com/grandgate.co/wp-content/uploads/2020/04/erbil.png?fit=2160%2C2160&ssl=1',
    ),
  ];

  List<Shop> get shops{
    return [..._shops];
  }

}
