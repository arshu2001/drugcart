import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserOrderDetails extends StatefulWidget {
  const UserOrderDetails({super.key});

  @override
  State<UserOrderDetails> createState() => _UserOrderDetailsState();
}

class _UserOrderDetailsState extends State<UserOrderDetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Orders Details', size: 18,weight: FontWeight.bold,),centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'All Orders', size: 18,weight: FontWeight.w600,),
              const SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 360,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: Colors.black
                      )
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                              child: CustomText(text: 'Your Order', size: 20.spMin),
                            ),
                             Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child: CustomText(text: 'Date', size: 20.spMin),
                            ),
                             Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child: CustomText(text: 'Phone', size: 20.spMin),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                              child: CustomText(text: ':', size: 20.spMin),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child: CustomText(text: ':', size: 20.spMin),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child: CustomText(text: ':', size: 20.spMin),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                              child: CustomText(text: 'Zincovit', size: 20.spMin),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child: CustomText(text: 'october 1', size: 20.spMin),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child: CustomText(text: '9857463837', size: 20.spMin),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kpinkcolor
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}