import 'package:drugcart/provider/cart_provider.dart';
import 'package:drugcart/user/bottomnav.dart';
import 'package:drugcart/user/cart/check_out.dart';
import 'package:drugcart/widget/constants.dart';
import 'package:drugcart/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final Provider = CartProvider.of(context);
    // final finalList = Provider.cart;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return   Scaffold(
      // for total check out
      bottomSheet: CheckOut(),
      backgroundColor: const Color.fromARGB(255, 227, 226, 226),
      appBar: AppBar(
        leading: IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BottonNav(),));
          }, icon: Icon(Icons.arrow_back)),
          title: Center(child: CustomText(text: 'My Cart', size: 20,weight: FontWeight.bold,)),
      ),
      body:  Column(
        children: [
          Expanded(child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              // final cartItems = finalList[index];
            return Stack(
              children: [
                Padding(padding: EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: kcontentColor
                        ),
                        child: Image.asset('images/zincovit.png'),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          )
                        ],
                      )

                    ],
                  ),
                ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(onPressed: () {
                  setState(() {
                    
                  });
                }, icon: Icon(Icons.delete,size: 22,)))
                
              ],
            );
          },))
        ],
      ),
    );
  }
}