import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/view/cart/cart.dart';
import 'package:drugcart/user/view/Category.dart';
import 'package:drugcart/user/view/favorate.dart';
import 'package:drugcart/user/view/home/home.dart';
import 'package:drugcart/user/view/userprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottonNav extends StatefulWidget {
  const BottonNav({super.key});

  @override
  State<BottonNav> createState() => _BottonNavState();
}

class _BottonNavState extends State<BottonNav> {
  int currentIndex =2;
  List screens = const [
    drawer(),
    favoritee(),
    UserHome(),
    Cart(),
    UserProfile(),
  ]; 
  @override
  Widget build(BuildContext context) {
    final ColorScheme=Theme.of(context).colorScheme;
    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          currentIndex = 2;
        });
      },
        shape: const CircleBorder(),
        backgroundColor: kprimaryColor,
        child: const Icon(
          Icons.home,
          color: Colors.white,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        height: 60,
        color: Theme.of(context).cardColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
              setState(() {
                currentIndex =0;
              });
            }, icon: Icon(Icons.grid_view_outlined,size: 30, color: currentIndex == 0 ? kprimaryColor : Colors.grey.shade400,)
            ),
            IconButton(
              onPressed: () {
              setState(() {
                currentIndex =1;
              });
            }, icon: Icon(Icons.favorite,size: 30, color: currentIndex == 1 ? kprimaryColor : Colors.grey.shade400,)
            ),
            IconButton(
              onPressed: () {
              setState(() {
                currentIndex =3;
              });
            }, icon: Icon(Icons.shopping_cart_rounded,size: 30, color: currentIndex == 3 ? kprimaryColor : Colors.grey.shade400,)
            ),
            IconButton(
              onPressed: () {
              setState(() {
                currentIndex =4;
              });
            }, icon: Icon(Icons.person,size: 30, color: currentIndex == 4 ? kprimaryColor : Colors.grey.shade400,)
            ),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}