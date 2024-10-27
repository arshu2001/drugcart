import 'package:drugcart/admin/allproduct/all_productview.dart';
import 'package:drugcart/admin/deliverytabbar.dart';
import 'package:drugcart/admin/medicalshop_tabbar.dart';
import 'package:drugcart/admin/userlist.dart';
import 'package:drugcart/admin/usertabbar.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  List<String> text=['Medical shop List','User List','Delivery Boy','All Product'];
  var pages=[MedicalTabbar(),UserTabbar(),DeliveryTabbar(),AllProduct()];
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
         AppBar(
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

          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: 4,
                  shrinkWrap: true,    
                itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 30.0,left: 20,right: 20),
                  child: SizedBox(
                    height: 60,
                 
                    child: ListTile(
                      
                      title:CustomText(text: text[index], size: 18) ,
                      tileColor: kpinkcolor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => pages[index],));
                      },
                    ),
                  ),
                );
              },),
            ),
          )
        ],
      ),
    );
  }
}