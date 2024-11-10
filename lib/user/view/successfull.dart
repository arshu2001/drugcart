import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class Successfull extends StatefulWidget {
  const Successfull({super.key});

  @override
  State<Successfull> createState() => _SuccessfullState();
}

class _SuccessfullState extends State<Successfull> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // backgroundColor: myColor.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("lotty/successfully.json",fit: BoxFit.cover,width: 200),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CustomText(text: "Successfully Added", size: 22, weight: FontWeight.w500),
              )
            ],
          ),
          
        ],
      ),
    );
  }
}