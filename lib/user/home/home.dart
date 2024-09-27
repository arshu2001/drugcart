// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:drugcart/user/home/gridview.dart';
import 'package:drugcart/user/home/imageslider.dart';
import 'package:drugcart/widget/cushomeappbar.dart';
import 'package:drugcart/widget/cussearchbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 252, 252),
        // for custom appbar
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // searchbar
                Cus_Searchbar(),
                SizedBox(height: 20,),
                // imageSlider
                ImageSlider(CurrentSlide: currentSlider, onChange: (value){
                  setState(() {
                    currentSlider = value;
                  });
                },),
                SizedBox(height: 20,),
                // for shopping items
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.60,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20
                    ),
                    itemCount: 10,
                     itemBuilder: (context, index) {
                       return ProductCard(quantity: currentSlider,);
                     },)
              ],
            ),
          ),
          
        ),
      )
      );
  }
}