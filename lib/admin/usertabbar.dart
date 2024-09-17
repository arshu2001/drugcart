import 'package:drugcart/admin/Userrequest.dart';
import 'package:drugcart/admin/userlist.dart';
import 'package:drugcart/model/constants.dart';
import 'package:drugcart/model/customtext.dart';
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
        bottom: PreferredSize(
          child: Container(
            color: Colors.black,
            height: 2.0,
          ),
          preferredSize: Size.fromHeight(.0),
        ),
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.37,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: const Color.fromARGB(255, 213, 212, 212),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: kprimaryColor,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  
                   dividerColor: Colors.white,
                      labelStyle: TextStyle(fontSize:18),
                      
                      labelColor: Colors.white,
                      isScrollable: true,
                      tabAlignment: TabAlignment.center,
                      labelPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 7),
                  tabs: [
                    Text('   List   '),
                    Text('Request')
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