
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/medical_shop/model/medicineadd_modal.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicineDetails extends StatefulWidget {
  final Medicine medicine;
  
  const MedicineDetails({Key? key,  required this.medicine}): super(key: key);

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  // List<String> imagepaths = [
  // 'images/zincovit.png',
  // 'images/zincovit.png'
  // ];
  int _currentpage = 0;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<String> imagePaths = List<String>.from(widget.medicine.imageurls);
    String medicineName = widget.medicine.medicinename;
    String medicinePrice = widget.medicine.medicineprice;
    String description = widget.medicine.description;
    String faq = widget.medicine.faq;
    // String discount = widget.data['discount'] ?? "0";
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF00796B),
          title: CustomText(
              text: 'Product Details',
              size: 24,
              weight: FontWeight.bold,
              color: Colors.black),centerTitle: true,
          // bottom: PreferredSize(
          //   child: Container(
          //     color: Colors.black,
          //     height: 2.0,
          //   ),
          //   preferredSize: Size.fromHeight(.0),
          // ),
        ),
        backgroundColor: Color(0xFFE3F2FD),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                items: imagePaths.map((e) => Center(
               child: Image.network(e), 
              )).toList(),
               options: CarouselOptions(
                initialPage: 0, 
                onPageChanged: (index, _) {
                 setState(() {
                   _currentpage = index;
                 }); 
                },
               )),
               buildCarouselIndicator(imagePaths),
               Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,left: 10),
                  child: CustomText(
                    text: '$medicineName ',
                     size: 20, weight: FontWeight.w600, color: Colors.black),
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
                        CustomText(text: 'MRP', size: 15.spMin,color: Colors.grey,),
                        CustomText(text: ' ₹$medicinePrice', size: 15, weight: FontWeight.normal, color: kgreyColor,decoration: TextDecoration.lineThrough,),
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
                      child: CustomText(
                        text: '₹101.20', size: 20,
                        //  text: '₹${(double.parse(medicinePrice) * (1 - double.parse(discount) / 100)).toStringAsFixed(2)}',
                         weight: FontWeight.normal, color: Colors.black),
                    )),
                    Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30,left: 10),
                      child: CustomText(text: '$description', size: 20, weight: FontWeight.w600, color: Colors.black),
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
                      child: CustomText(text: 'Category', size: 20, weight: FontWeight.w600, color: Colors.black),
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
                      child: CustomText(text: '$faq', size: 20, weight: FontWeight.w600, color: Colors.black),
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
      ),
    );
  }
  buildCarouselIndicator(List<String> imagePaths){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for(int i = 0; i < imagePaths.length; i++)
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