import 'package:drugcart/medical_shop/view/home.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MedicalNotification extends StatefulWidget {
  const MedicalNotification({super.key});

  @override
  State<MedicalNotification> createState() => _MedicalNotificationState();
}

class _MedicalNotificationState extends State<MedicalNotification> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(
            child: CustomText(
                text: 'Notification',
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 15,top: 20),
              child: CustomText(
                  text: 'Name',
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
                  maxLines: 5,
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
              padding: const EdgeInsets.only(top: 290),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green
                    ),
                    onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalHome(),));
                  }, child: CustomText(text: 'Submit', size: 24, weight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            )
        ],
      ),
    );
  }
}