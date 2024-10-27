import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/provider/cart_provider.dart';
import 'package:drugcart/user/view/successfull.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Payment extends StatefulWidget {
  final double totalAmount;
  const Payment({Key? key, required this.totalAmount}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String? _selectedPaymentMethod = "Cash on Delivery";
  final double totalAmount = 150.0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String userName = '';
  String userEmail = '';
  String userAddress = '';
  String userPhone = '';

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userData = await _firestore.collection("Users").doc(user.uid).get();
        setState(() {
          userName = userData['name'] ?? 'No name found';
          userEmail = userData['email'] ?? '';
          userAddress = userData['address'] ?? '';
          userPhone = userData['phone'] ?? '';
        });
      }
    } catch (e) {
      print("Error getting user data: $e");
    }
  }

  Future<void> submitOrder() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        // Get the cart items from provider
        final cartProvider = Provider.of<CartProvider>(context, listen: false);
        
        // Create order data
        Map<String, dynamic> orderData = {
          'userId': user.uid,
          'userName': userName,
          'userEmail': userEmail,
          'userAddress': userAddress,
          'userPhone': userPhone,
          'orderDate': Timestamp.now(),
          'totalAmount': widget.totalAmount,
          'paymentMethod': _selectedPaymentMethod,
          'status': 'pending',
          'items': cartProvider.cartItems.map((item) => {
            'medicineName': item.medicinename,
            'medicinePrice': item.medicineprice,
            'imageUrl': item.imageurls[0],
          }).toList(),
        };

        // Add order to Firestore
        await _firestore.collection('Orders').add(orderData);

        // Clear cart after successful order
        cartProvider.clearCart();

        // Navigate to success page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Successfull()),
        );
      }
    } catch (e) {
      print("Error submitting order: $e");
      // Show error message to user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to place order. Please try again.')),
      );
    }
  }

  Future<void> _launchGooglePay() async {
    final uri = Uri.parse(
      "upi://pay?pa=merchant@bank&pn=Merchant&mc=1234&tr=123456789&tn=Payment&am=$totalAmount&cu=INR",
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print("Could not open Google Pay");
    }
  }
  
  Future<void> _launchPhonePe() async {
    final uri = Uri.parse(
      "phonepe://pay?pa=merchant@bank&pn=Merchant&mc=1234&tr=123456789&tn=Payment&am=$totalAmount&cu=INR",
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print("Could not open PhonePe");
    }
  }
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
                child: CustomText(text: '₹${widget.totalAmount.toStringAsFixed(2)}', size: 18),
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
                      GestureDetector(
                        onTap: () {
                          _launchGooglePay();
                        },
                        child: Container(
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
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchPhonePe();
                        },
                        child: Container(
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
                        ),
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
                       Radio(
                        value: "Cash on Delivery",
                        groupValue: _selectedPaymentMethod,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedPaymentMethod = value;
                          });
                        },
                      ),
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
                              submitOrder();
                            
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