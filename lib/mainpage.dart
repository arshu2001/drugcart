import 'package:drugcart/admin/login.dart';
import 'package:drugcart/delivery_boy.dart/view/delivery_login.dart';
import 'package:drugcart/delivery_boy.dart/view/delivery_splash.dart';
import 'package:drugcart/medical_shop/view/login.dart';
import 'package:drugcart/medical_shop/view/splash.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:drugcart/user/splash.dart';
import 'package:drugcart/user/view/userlogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    // return  Scaffold(
    //   body: Align(
    //     alignment: Alignment.center,
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //       children: [
    //         ElevatedButton(onPressed: () {
    //           Navigator.push(context, MaterialPageRoute(builder: (context) => AdminLogin(),));
    //         }, child: Text('Admin')),
    //         ElevatedButton(onPressed: () {
    //           Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalLogin(),));
    //         }, child: Text('Medical')),
    //         ElevatedButton(onPressed: () {
    //           Navigator.push(context, MaterialPageRoute(builder: (context) => UserLogin(),));
    //         }, child: Text('User')),
    //         ElevatedButton(onPressed: () {
    //           Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryLogin(),));
    //         }, child: Text('Delivery boy'))
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
      
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            CustomText(
              text: 'Welcome !',
              size: 36.sp,
              weight: FontWeight.bold,
              color: Colors.black,
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomText(
              text: 'choose your role ',
              size: 16.sp,
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 160.h,
                  width: 150.w,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminLogin(),
                          ));
                    },
                    child: Card(
                      color: kprimaryColor,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          // Image(image: AssetImage('images/userimg.png')),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomText(
                            text: 'Admin',
                            size: 16.sp,
                            color: Colors.black,
                            weight: FontWeight.w600,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 160.h,
                  width: 150.w,
                  child: InkWell(
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MedicalLogin(),
                          ));
                    },
                    child: Card(
                      color: kprimaryColor,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          // Image(image: AssetImage('images/chef.png')),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomText(
                            text: 'Medical Shop',
                            size: 16.sp,
                            color: Colors.black,
                            weight: FontWeight.w600,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
             SizedBox(
              height: 30.h,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 160.h,
                  width: 150.w,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UserLogin(),
                          ));
                    },
                    child: Card(
                      color: kprimaryColor,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          // Image(image: AssetImage('images/userimg.png')),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomText(
                            text: 'User',
                            size: 16.sp,
                            color: Colors.black,
                            weight: FontWeight.w600,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 160.h,
                  width: 150.w,
                  child: InkWell(
                    onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DeliveryLogin(),
                          ));
                    },
                    child: Card(
                      color: kprimaryColor,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          // Image(image: AssetImage('images/chef.png')),
                          SizedBox(
                            height: 10.h,
                          ),
                          CustomText(
                            text: 'Delivery Boy',
                            size: 16.sp,
                            color: Colors.black,
                            weight: FontWeight.w600,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
           
          ],
        ),
      )),
    );
  }
}