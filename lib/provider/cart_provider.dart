import 'package:drugcart/user/view/home/gridview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductCard> _cart = [];
  List<ProductCard> get cart => _cart;
  void toggleFavorite(ProductCard productCard){
    if(_cart.contains(ProductCard())){
      for(ProductCard element in _cart){
        element.quantity!;
      }
    }else{
      _cart.add(productCard);
    }
    notifyListeners();
  }
    //   totalPrice(){
    //   double total1 = 0.0;
    //   for(ProductCard element in _cart){
    //     total1 += element.pirice * element.quantity;
    //   }
    //   return total1;
    // }
  static CartProvider of(BuildContext context,{
    bool listen = true,
  }){
    return Provider.of<CartProvider>(
      context , listen: listen
      );
  }
}