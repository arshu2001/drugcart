// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:drugcart/model/cushomeappbar.dart';
import 'package:drugcart/model/cussearchbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
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
                Cus_Searchbar()
              ],
            ),
          ),
        ),
      )
      );
  }
}