import 'package:drugcart/user/view/add_address.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserBuy extends StatefulWidget {
  const UserBuy({super.key});

  @override
  State<UserBuy> createState() => _UserBuyState();
}

class _UserBuyState extends State<UserBuy> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: kpalecolor,
      appBar: AppBar(
        title: CustomText(text: 'Product Bill', size: 20,weight: FontWeight.bold,),centerTitle: true,
      ),
      body: Column(
          children: [
            Expanded(child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              // final cartItems = finalList[index];
            return Stack(
              children: [
                Padding(padding: EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3)
                      )
                    ]
                  ),
                  child: IntrinsicHeight(
                    child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Expanded(
                            flex: 2,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: kcontentColor
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)
                                ),
                                child: Image.asset('images/zincovit.png',fit: BoxFit.cover,)),
                            ),
                          ),
                        ),
                        
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(text: 'Zincovit Stripof Tablet(Green)', size: 15,weight: FontWeight.w600,),
                                SizedBox(height: 5.spMin,),
                                Wrap(
                                  children: [
                                    CustomText(text: 'MRP', size: 15,weight: FontWeight.w600,color: Colors.black,),
                               Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: CustomText(text: '₹110.00', size: 15,weight: FontWeight.w600,color: Colors.black,),
                                    ) 
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                    
                      ],
                    ),
                  ),
                ),
                ),
                
              ],
            );
          },)),
          Container(
            height: MediaQuery.of(context).size.height * 0.51,
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3)
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Bill Summery', size: 18,weight: FontWeight.w600,),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(text: 'MRP', size: 16,color: Colors.grey,),
                                CustomText(text: 'Discount', size: 16,color: Colors.grey,),
                                CustomText(text: 'Delivery Fee', size: 16,color: Colors.grey,),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CustomText(text: '₹110.00', size: 18,weight: FontWeight.w400,),
                                CustomText(text: '8%', size: 18,color: Colors.green,),
                                CustomText(text: '₹40', size: 18,weight: FontWeight.w400,),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 30,),
                        Divider(),
                        const SizedBox(height: 30,),
                         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(text: 'Total Amount', size: 18,weight: FontWeight.w600,),
                            CustomText(text: '₹150', size: 18,weight: FontWeight.w400,),
                          ],
                        ),
                        const SizedBox(height: 40,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(text: '₹150', size: 18,weight: FontWeight.w400,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green
                              ),
                              onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Add_Address(),));
                            }, child: CustomText(text: 'Add to Delivery', size: 18,color: Colors.white,))
                          ],
                        )
                      ],
                    ),
                  ),
            
          )
          ],
        ),
    );
  }
}