import 'package:drugcart/user/model/widget/customtext.dart';
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
    return  Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Category', size: 20,weight: FontWeight.bold,),centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            
          }, icon: Icon(Icons.search))
        ],
      ),
      backgroundColor: Colors.blue,
    );
  }
}