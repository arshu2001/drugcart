import 'package:drugcart/user/view/successfull.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Payment', size: 18,weight: FontWeight.bold,),centerTitle: true,
      ),
      backgroundColor: kpalecolor,
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30,left: 10),
                child: CustomText(text: 'Amount Payable', size: 18,color: Colors.grey,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30,right: 10),
                child: CustomText(text: '₹150.0', size: 18),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.78,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(text: 'Pay by any UPI app', size: 18,weight: FontWeight.w600,)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3)
                      )
                    ]
                        ),
                        child: Image.asset('images/google.png',fit: BoxFit.fill,),
                      ),
                      Container(
                         height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3)
                      )
                    ]
                        ),
                        child: Image.asset('images/Phone.png',fit: BoxFit.fill,),
                      )
                    ],
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomText(text: 'Google Pay', size: 18,color: Colors.grey,),
                    CustomText(text: 'Phone Pay', size: 18,color: Colors.grey,)
                  ],
                ),
                const SizedBox(height: 40,),
                const Divider(),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CustomText(text: 'Other Options', size: 18,weight: FontWeight.w600,)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 0.02,
                              blurRadius: 0.02, 
                            )
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          
                        ),
                        child: Image.asset('images/cash.png',fit: BoxFit.contain,),
                      ),
                      CustomText(text: 'Cash on Delivery', size: 18,weight: FontWeight.w600,),
                      CircleAvatar(radius: 10,)
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.87,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green
                            ),
                            onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(),));
                          }, child: CustomText(text: 'Submit', size: 24, weight: FontWeight.bold, color: Colors.white)),
                        ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}