import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserHeader extends StatefulWidget {
  const UserHeader({super.key});

  @override
  State<UserHeader> createState() => _HeadDrawerState();
}

class _HeadDrawerState extends State<UserHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kpinkcolor,
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 70,
            height: 70,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage('images/ravi.png'))
            ),
          ),
          CustomText(text: 'Medi Care', size: 20, weight: FontWeight.normal, color: Colors.black),
          CustomText(text: 'medicare@gmail.com', size: 16, weight: FontWeight.normal, color: Colors.white),
          CustomText(text: '+91-7665477456', size: 16, weight: FontWeight.normal, color: Colors.white),


        ],
      ),
    );
  }
}