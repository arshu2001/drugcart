import 'package:carousel_slider/carousel_slider.dart';
import 'package:drugcart/model/constants.dart';
import 'package:drugcart/model/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MedicineDetails extends StatefulWidget {
  const MedicineDetails({super.key});

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  List<String> imagepaths = [
  'images/zincovit.png',
  'images/zincovit.png'
  ];
  int _currentpage = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: AppBar(
        title: Center(
            child: CustomText(
                text: 'Product Details',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(items: imagepaths.map((e) => Center(
             child: Image.asset(e), 
            )).toList(),
             options: CarouselOptions(
              initialPage: 0, 
              onPageChanged: (index, _) {
               setState(() {
                 _currentpage = index;
               }); 
              },
             )),
             buildCarouselIndicator(),
             Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: CustomText(text: 'Zincovit Strip of 15 Tablets (Green) ', size: 20, weight: FontWeight.w600, color: Colors.black),
              )),
             Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: CustomText(text: 'Include of all taxes', size: 16, weight: FontWeight.normal, color: kgreyColor),
              )),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,left: 10),
                  child: Row(
                    children: [
                      CustomText(text: 'MRP ₹110.00', size: 14, weight: FontWeight.normal, color: kgreyColor),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: CustomText(text: '8% OFF', size: 16, weight: FontWeight.normal, color: Colors.red),
                      ),
                    ],
                  ),
                )),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,left: 10),
                    child: CustomText(text: '₹101.20', size: 20, weight: FontWeight.normal, color: Colors.black),
                  )),
                  Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30,left: 10),
                    child: CustomText(text: 'Description', size: 20, weight: FontWeight.w600, color: Colors.black),
                  )),
                  Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,left: 10),
                    child: CustomText(text: 'Zincovit tablets can help in treating andpreventing vitamin and mineraldeficiencies. It also helps in protectingthe body from damage, helping improveimmunity, metabolism and other bodyfunctions.', size: 15, weight: FontWeight.normal, color: Colors.black),
                  )),
                  Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30,left: 10),
                    child: CustomText(text: 'FAQ', size: 20, weight: FontWeight.w600, color: Colors.black),
                  )),
                  Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,left: 10),
                    child: CustomText(text: 'Q: How many Zincovit tables Should i take daily?', size: 20, weight: FontWeight.w600, color: Colors.black),
                  )),
                   Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10,left: 10),
                    child: CustomText(text: 'A: Take Zincovit tablet as per yourdoctors advice. Do not take more thanthe recommended dose of this supplement as this may lead to an overdose.', size: 15, weight: FontWeight.normal, color: Colors.black),
                  )),
          ],
        ),
      ),
    );
  }
  buildCarouselIndicator(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for(int i = 0; i < imagepaths.length; i++)
        Container(
          margin: EdgeInsets.all(5),
          height: i== _currentpage? 7:5,
          width: i== _currentpage? 7:5,
          decoration: BoxDecoration(
            color: i == _currentpage ? Colors.black : Colors.grey,
            shape: BoxShape.circle
          ),
        )
      ],
    );
  }
}