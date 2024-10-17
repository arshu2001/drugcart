import 'package:drugcart/delivery_boy.dart/view/bottomnav/delivery_history.dart';
import 'package:drugcart/delivery_boy.dart/view/bottomnav/delivery_home.dart';
import 'package:drugcart/delivery_boy.dart/view/bottomnav/delivery_profile.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliveryBottomnav extends StatefulWidget {
  const DeliveryBottomnav({super.key});

  @override
  State<DeliveryBottomnav> createState() => _DeliveryBottomnavState();
}

class _DeliveryBottomnavState extends State<DeliveryBottomnav> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    DeliveryHome(),
    DeliveryHistory(),
    DeliveryProfile()
  ];

  void _onTap(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
  index: _currentIndex,
  children: _pages,
),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(icon: IconButton(onPressed: () {
            setState(() {
              _currentIndex = 0;
            });
          }, icon: Icon(Icons.home,size: 40,color: _currentIndex == 0 ? kprimaryColor : Colors.grey.shade400,)), label: 'Home'),
          BottomNavigationBarItem(icon: IconButton(onPressed: () {
            setState(() {
              _currentIndex = 1;
            });
          }, icon: Icon(Icons.history,size: 40,color: _currentIndex == 1 ? kprimaryColor : Colors.grey.shade400,)), label: 'History'),
          BottomNavigationBarItem(icon: IconButton(onPressed: () {
            setState(() {
              _currentIndex = 2;
            });
          }, icon: Icon(Icons.person,size: 40,color: _currentIndex == 2 ? kprimaryColor : Colors.grey.shade400,)), label: 'Profile'),
        ]
      ),
    );
  }
}