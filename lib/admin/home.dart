import 'package:drugcart/admin/deliverytabbar.dart';
import 'package:drugcart/admin/medicalshop_tabbar.dart';
import 'package:drugcart/admin/usertabbar.dart';
import 'package:drugcart/model/constants.dart';
import 'package:drugcart/model/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryColor,
        automaticallyImplyLeading: false,
        title: CustomText(text: 'Home', size: 24, weight: FontWeight.w600, color: Colors.black),
        actions: [
          IconButton(onPressed: () {
            showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: CustomText(text: 'LogOut', size: 20, weight: FontWeight.w600, color: Colors.black),
                content: CustomText(text: 'Are you sure your you want to logout?', size: 16, weight: FontWeight.normal, color: Colors.black),
                actions: [
                  TextButton(onPressed: () {
                    
                  }, child: CustomText(text: 'yes', size: 16, weight: FontWeight.w400, color: Colors.black)),
                  TextButton(onPressed: () {
                    
                  }, child: CustomText(text: 'no', size: 16, weight: FontWeight.w400, color: Colors.black))
                  
                ],
              );
            },);
          }, icon: Icon(Icons.logout_rounded,size: 30,))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalTabbar(),));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kprimaryColor
                ),
                child: Center(child: CustomText(text: 'Medical Shope', size: 24, weight: FontWeight.w600, color: Colors.black)),
              ),
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => UserTabbar(),)); 
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kprimaryColor
                ),
                child: Center(child: CustomText(text: 'User', size: 24, weight: FontWeight.w600, color: Colors.black)),
              ),
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryTabbar(),));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kprimaryColor
                ),
                child: Center(child: CustomText(text: 'Delivery boy', size: 24, weight: FontWeight.w600, color: Colors.black)),
              ),
            ),
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kprimaryColor
              ),
              child: Center(child: CustomText(text: 'History', size: 24, weight: FontWeight.w600, color: Colors.black)),
            ),
          )
        ],
      ),
    );
  }
}