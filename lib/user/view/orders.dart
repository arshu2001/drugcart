import 'package:drugcart/user/view/order_details.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserOrders extends StatefulWidget {
  const UserOrders({super.key});

  @override
  State<UserOrders> createState() => _UserOrdersState();
}

class _UserOrdersState extends State<UserOrders> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Orders', size: 18,weight: FontWeight.bold,),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: 'All Orders', size: 18,weight: FontWeight.w600,),
            GestureDetector(
              onDoubleTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UserOrderDetails(),));
              },
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                width: double.infinity,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Image.asset('images/zincovit.png',fit: BoxFit.fill,),
                      ),
                    ),
                    Flexible(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Zincovit strip of 15 Tablets (Green)',
                         size: 18,
                         weight: FontWeight.w600,
                        //  textOverflow: TextOverflow.ellipsis,
                         ),
                         Padding(
                           padding: const EdgeInsets.only(top: 10),
                           child: CustomText(text: 'Placed on oct 1', size: 16,weight: FontWeight.w400,color: Colors.grey,),
                         )
                      ],
                    )),
                     
                  ],
                ),
              ),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}