// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminMedicalProfile extends StatefulWidget {
  const AdminMedicalProfile({super.key});

  @override
  State<AdminMedicalProfile> createState() => _AdminMedicalProfileState();
}

class _AdminMedicalProfileState extends State<AdminMedicalProfile> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: CustomText(text: 'Profile', size: 24, weight: FontWeight.w600, color: Colors.black)),
        ),
        body: SingleChildScrollView(
          child: Column(
            
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/profile.jpg'),),
                  ],
                ),
              ),
              
              
            ],
          ),
        ),
      ),
    );
  }
}