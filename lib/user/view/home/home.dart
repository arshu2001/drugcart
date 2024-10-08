// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:drugcart/user/view/home/gridview.dart';
import 'package:drugcart/user/view/home/imageslider.dart';
import 'package:drugcart/user/view/user_header.dart';
import 'package:drugcart/user/view/legal_information.dart';
import 'package:drugcart/user/view/notification.dart';
import 'package:drugcart/user/view/orders.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/cushomeappbar.dart';
import 'package:drugcart/user/model/widget/cussearchbar.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {

  File ? selectedImage;
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: kpalecolor,
        // for custom appbar
        appBar: AppBar(
          backgroundColor: kpinkcolor,

      title: CustomText(text: 'Home', size: 24, weight: FontWeight.bold, color: Colors.black),
      actions: [
        IconButton(onPressed: () {
          pickImageFromCamera();
        }, icon: Icon(Icons.camera_alt_rounded)),
        IconButton(
          onPressed: () {
            // Handle the notifications icon button action
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserNotification(),));
          },
          icon: Icon(Icons.notifications),
        ),
        // Add more action buttons if needed
      ],
        ),
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
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  UserHeader(),
                  UserDrawerList()
                ],
              ),
            ),
          ),
         ),
      )
      );
  }
    Future pickImageFromCamera() async{
    final returnedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if(returnedImage == null)return;
    setState(() {
      selectedImage = File(returnedImage.path);
    });
  }
  Widget UserDrawerList(){
    return Column(
      children: [
        ListTile(
           leading: Icon(Icons.assignment),
                    title: const Text('Orders'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UserOrders(),));
                    },
        ),
         ListTile(
           leading: Icon(Icons.info_outlined),
                    title: const Text('Legal Information'),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LegalInformation(),));
                    },
        ),
         ListTile(
           leading: Icon(Icons.logout_rounded),
                    title: const Text('LogOut'),
                    onTap: (){
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: CustomText(text: 'LogOut', size: 20,weight: FontWeight.w600,color: Colors.black,),
                          content: CustomText(text: 'Are you sure your you want to logout?', size: 16, weight: FontWeight.normal, color: Colors.black),
                actions: [
                  TextButton(onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalLogin(),));
                  }, child: CustomText(text: 'yes', size: 16, weight: FontWeight.w400, color: Colors.black)),
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: CustomText(text: 'no', size: 16, weight: FontWeight.w400, color: Colors.black))
                ]
                        );
                      },);
                    },
        ),

        

      ],
    );
    
  }
}