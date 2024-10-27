import 'package:drugcart/user/view/add_address.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:drugcart/user/view/payment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drugcart/provider/cart_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserBuy extends StatelessWidget {
  const UserBuy({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    
    // Calculate total MRP
    double totalMRP = cartProvider.cartItems.fold(0, (total, item) {
      return total + double.parse(item.medicineprice);
    });
    
    // Calculate discount amount (8%)
    // double discount = totalMRP * 0.08;
    // Delivery fee
    const double deliveryFee = 40;
    // Calculate final total
    // double totalAmount = totalMRP - discount + deliveryFee;
    double totalAmount = totalMRP + deliveryFee;


    return Scaffold(
      backgroundColor: kpalecolor,
      appBar: AppBar(
        title: CustomText(
          text: 'Product Bill',
          size: 20,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartProvider.cartItems[index];
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
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
                              offset: const Offset(0, 3)
                            )
                          ]
                        ),
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: kcontentColor
                                  ),
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)
                                    ),
                                    child: Image.network(
                                      cartItem.imageurls[0],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomText(
                                        text: cartItem.medicinename,
                                        size: 15,
                                        weight: FontWeight.w600,
                                      ),
                                      SizedBox(height: 5.spMin),
                                      Wrap(
                                        children: [
                                           CustomText(
                                            text: 'MRP',
                                            size: 15,
                                            weight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20),
                                            child: CustomText(
                                              text: '₹${cartItem.medicineprice}',
                                              size: 15,
                                              weight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
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
              },
            ),
          ),
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
                  offset: const Offset(0, 3)
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Bill Summary',
                    size: 18,
                    weight: FontWeight.w600,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: 'MRP', size: 16, color: Colors.grey),
                          // CustomText(text: 'Discount', size: 16, color: Colors.grey),
                          CustomText(text: 'Delivery Fee', size: 16, color: Colors.grey),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomText(
                            text: '₹${totalMRP.toStringAsFixed(2)}',
                            size: 18,
                            weight: FontWeight.w400,
                          ),
                          //  CustomText(
                          //   text: '8%',
                          //   size: 18,
                          //   color: Colors.green,
                          // ),
                           CustomText(
                            text: '₹40',
                            size: 18,
                            weight: FontWeight.w400,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       CustomText(
                        text: 'Total Amount',
                        size: 18,
                        weight: FontWeight.w600,
                      ),
                      CustomText(
                        text: '₹${totalAmount.toStringAsFixed(2)}',
                        size: 18,
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // CustomText(
                      //   text: '₹${totalAmount.toStringAsFixed(2)}',
                      //   size: 18,
                      //   weight: FontWeight.w400,
                      // ),
                      TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Add_Address(),));
                  }, child: CustomText(text: 'Edit Address', size: 18,color: Colors.blueAccent,)),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Payment(totalAmount: totalAmount)),
                          );
                        },
                        child:  CustomText(
                          text: 'Buy Now',
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
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