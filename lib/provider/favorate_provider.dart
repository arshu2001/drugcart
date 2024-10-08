import 'package:drugcart/user/view/favorate.dart';
import 'package:drugcart/user/view/home/gridview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<ProductCard> _favorite = [];
  List<ProductCard> get favorite => _favorite;
  void toggleFavorite(ProductCard productCard){
    if(_favorite.contains(ProductCard())){
      _favorite.remove(ProductCard());
      
    }else{
      _favorite.add(productCard);
    }
    notifyListeners();
  }
  bool isExist(ProductCard productCard){
    final isExist = _favorite.contains(ProductCard());
    return isExist;
  }
  static FavoriteProvider of(BuildContext context,{
    bool listen = true,
  }){
    return Provider.of<FavoriteProvider>(
      context , listen: listen
      );
  }
}