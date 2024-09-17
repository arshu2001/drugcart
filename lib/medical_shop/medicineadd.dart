// ignore_for_file: sort_child_properties_last

import 'package:drugcart/medical_shop/product_details.dart';
import 'package:drugcart/model/constants.dart';
import 'package:drugcart/model/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MedicineAdd extends StatefulWidget {
  const MedicineAdd({super.key});

  @override
  State<MedicineAdd> createState() => _MedicineAddState();
}

class _MedicineAddState extends State<MedicineAdd> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: CustomText(
                text: 'Medicine Add',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.height * 0.44,
                  color: kprimaryColor,
                  child: Icon(
                    Icons.add_photo_alternate_outlined,
                    size: 100,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: CustomText(
                  text: 'Medicine Name',
                  size: 18,
                  weight: FontWeight.normal,
                  color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: kgreyColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: kcontentColor,
                      hintText: 'enter the name',
                      helperStyle: TextStyle(color: kgreyColor)),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: CustomText(
                  text: 'Price',
                  size: 18,
                  weight: FontWeight.normal,
                  color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: kgreyColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: kcontentColor,
                      hintText: 'enter the price',
                      helperStyle: TextStyle(color: kgreyColor)),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: CustomText(
                  text: 'Offer',
                  size: 18,
                  weight: FontWeight.normal,
                  color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: kgreyColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      filled: true,
                      fillColor: kcontentColor,
                      hintText: 'enter the offer',
                      helperStyle: TextStyle(color: kgreyColor)),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: CustomText(
                  text: 'Description',
                  size: 18,
                  weight: FontWeight.normal,
                  color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  maxLines: 10,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: kgreyColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      
                      filled: true,
                      fillColor: kcontentColor,
                      hintText: 'enter the description',
                      helperStyle: TextStyle(color: kgreyColor)),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: CustomText(
                  text: 'FAQ',
                  size: 18,
                  weight: FontWeight.normal,
                  color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: kgreyColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      
                      filled: true,
                      fillColor: kcontentColor,
                      hintText: 'enter the FAQ',
                      helperStyle: TextStyle(color: kgreyColor)),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kprimaryColor
                  ),
                  onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineDetails(),));
                }, child: CustomText(text: 'Submit', size: 24, weight: FontWeight.bold, color: Colors.black)),
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
