import 'package:drugcart/admin/Userrequest.dart';
import 'package:drugcart/admin/userlist.dart';
import 'package:drugcart/widget/constants.dart';
import 'package:drugcart/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserTabbar extends StatefulWidget {
  const UserTabbar({super.key});

  @override
  State<UserTabbar> createState() => _UserTabbarState();
}

class _UserTabbarState extends State<UserTabbar> {
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
                text: 'User',
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
          mainAxisAlignment: MainAxisAlignment.center,
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
                UserList(),
                UserRequest()
              ]),
            )

            
          ],
        ),
      ));
  }
}