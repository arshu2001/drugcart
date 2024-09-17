import 'package:carousel_slider/carousel_slider.dart';
import 'package:drugcart/model/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MedicineDetails extends StatefulWidget {
  const MedicineDetails({super.key});

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  List<String> imagepaths = [
  'images/zincovit.png',
  'images/iron.png'
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
      body: Column(
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
           buildCarouselIndicator()
        ],
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