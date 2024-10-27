import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:drugcart/admin/usertabbar.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:drugcart/user/view/bottomnav.dart';
import 'package:drugcart/user/view/category/ayurvedic_Care.dart';
import 'package:drugcart/user/view/category/pain_relief.dart';
import 'package:drugcart/user/view/category/skin_care.dart';
import 'package:drugcart/user/view/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      initialIndex: 1,
      length: 6,
       child: Scaffold(
        appBar: AppBar(
        title: CustomText(text: 'Category', size: 20,weight: FontWeight.bold,),centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BottonNav(),));
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          IconButton(onPressed: () {
            
          }, icon: Icon(Icons.search)),
        ],
        bottom: ButtonsTabBar(
          backgroundColor: kprimaryColor,
          // unselectedBackgroundColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          labelStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
          splashColor: Colors.purpleAccent,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          labelSpacing: 10,
          tabs: const [
            Tab(
              
              text: 'Pain Relief',
            ),
            Tab(
             
              text: 'Skin Care',
            ),
            Tab(
              
              text: 'Ayurvedic care',
            ),
             Tab(
              
              text: 'Diabetic Care',
            ),
            Tab(
              
              text: 'Oral Care',
            ),
            Tab(
              
              text: 'Baby care',
            )
        ])
      ),
        body: const TabBarView(children: [
          PainRelief(),
          SkinCare(),
          AyurvedicCare()
        ]),
       )
       );
  }
}