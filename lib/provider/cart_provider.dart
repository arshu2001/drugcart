// import 'package:drugcart/user/view/home/gridview.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CartProvider extends ChangeNotifier {
//   final List<ProductCard> _cart = [];
//   List<ProductCard> get cart => _cart;
//   void toggleFavorite(ProductCard productCard){
//     if(_cart.contains(ProductCard())){
//       for(ProductCard element in _cart){
//         element.quantity!;
//       }
//     }else{
//       _cart.add(productCard);
//     }
//     notifyListeners();
//   }
//     //   totalPrice(){
//     //   double total1 = 0.0;
//     //   for(ProductCard element in _cart){
//     //     total1 += element.pirice * element.quantity;
//     //   }
//     //   return total1;
//     // }
//   static CartProvider of(BuildContext context,{
//     bool listen = true,
//   }){
//     return Provider.of<CartProvider>(
//       context , listen: listen
//       );
//   }
// }

import 'package:drugcart/medical_shop/model/medicineadd_modal.dart';
import 'package:flutter/cupertino.dart';

class CartProvider with ChangeNotifier{
  List<Medicine> _cartItems =[];

  List<Medicine> get cartItems => _cartItems;

  // add item to cart
  void addToCart(Medicine medicine){
    _cartItems.add(medicine);
    notifyListeners();
  }

  // Remove item from cart
  void removeFromCart(Medicine medicine){
    _cartItems.remove(medicine);
    notifyListeners();
  }

  // clear all items from cart
  void clearCart(){
    _cartItems.clear();
    notifyListeners();
  }

  // get total items count
  int get cartItemsCount => _cartItems.length;
}