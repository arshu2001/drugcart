// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:drugcart/admin/medicallist.dart';
import 'package:drugcart/admin/medicalrequest.dart';
import 'package:drugcart/widget/constants.dart';
import 'package:drugcart/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicalTabbar extends StatefulWidget {
  const MedicalTabbar({super.key});

  @override
  State<MedicalTabbar> createState() => _MedicalTabbarState();
}

class _MedicalTabbarState extends State<MedicalTabbar> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
        title: Center(
            child: CustomText(
                text: 'Medical Shop',
                size: 24,
                weight: FontWeight.bold,
                color: Colors.black)),
        // bottom: PreferredSize(
        //   child: Container(
        //     color: Colors.black,
        //     height: 2.0,
        //   ),
        //   preferredSize: Size.fromHeight(.0),
        // ),
      ),
        body: Column(
         
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(color:  Color(0xff313131),borderRadius: BorderRadius.circular(10)),
                  
                  child: TabBar(
                    dividerHeight: 0,
                    indicator:BoxDecoration(
                      color: kprimaryColor,
                      borderRadius: BorderRadius.circular(10)
                    ) ,
                       labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                    
                    tabs: [
                    CustomText(text: 'List', size: 16),
                    CustomText(text: 'Request', size: 16),
                    
                  ]),
                ),
              ),
            Expanded(
              child: TabBarView(children: [
                MedicalList(),
                MedicalRequest()
              ]),
            )

            
          ],
        ),
      ),
    );
  }
}