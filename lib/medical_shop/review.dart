import 'package:drugcart/widget/constants.dart';
import 'package:drugcart/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MedicalReview extends StatefulWidget {
  const MedicalReview({super.key});

  @override
  State<MedicalReview> createState() => _MedicalReviewState();
}

class _MedicalReviewState extends State<MedicalReview> {
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: CustomText(
                text: 'Review',
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
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width:MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0xFFE3E7F9)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 10),
                  child: CustomText(text: 'Name', size: 20, weight: FontWeight.w600, color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 20),
                  child: CustomText(text: 'Zincovit tablets can help in treating andpreventing vitamin and mineraldeficiencies. It also helps in protectingthe body from damage, helping improveimmunity, metabolism and other bodyfunctions.', size: 15, weight: FontWeight.normal, color: kgreyColor),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}