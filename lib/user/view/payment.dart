import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/provider/cart_provider.dart';
import 'package:drugcart/user/model/widget/custom_textfield.dart';
import 'package:drugcart/user/view/successfull.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Payment extends StatefulWidget {
  final double totalAmount;
  const Payment({Key? key, required this.totalAmount}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String? _selectedPaymentMethod;
  final double totalAmount = 10.0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String userName = '';
  String userEmail = '';
  String userAddress = '';
  String userPhone = '';
  String upiId = "arshadkokkoli-1@oksbi";
  String phonepe = '6282607722@axl';

  late Razorpay _razorpay;
  TextEditingController amtController = TextEditingController();

  void openCheckout(amount) async{
    amount = amount * 100;
    var Options = {
      'key' : 'rzp_test_1DP5mmOlf5G5ag',
      'amount' : amount,
      'name' : 'name',
      'prefill' : {'contact' : '1234567890' ,'email' : 'test@gmail.com'},
      'external' : {
        'wallets' : ['Paytm']
      }

    };
    try {
      _razorpay.open(Options);

    } catch (e) {
      debugPrint('error : e');
    }
  }

  void handlepaymentSuccess(PaymentSuccessResponse response){
    Fluttertoast.showToast(msg: "payment Successfull" +response.paymentId!,toastLength: Toast.LENGTH_SHORT);
  }

  void handlepaymenterror(PaymentFailureResponse response){
    Fluttertoast.showToast(msg: "payment Fail" +response.message!,toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response){
    Fluttertoast.showToast(msg: "External Wallet" +response.walletName!,toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }
  @override
  void initState() {
    super.initState();
    getUserData();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlepaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlepaymenterror);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
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
      final String userid=FirebaseAuth.instance.currentUser!.uid;
        // Add order to Firestore
        await _firestore.collection('Orders').doc(userid).collection('orderlist'). add(orderData);

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
      "upi://pay?pa=$upiId&pn=Merchant&mc=1234&tr=123456789&tn=Payment&am=${widget.totalAmount.toStringAsFixed(2)}&cu=INR",
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print("Could not open Google Pay");
    }
  }
  
  Future<void> _launchPhonePe() async {
    final uri = Uri.parse(
      "phonepe://pay?pa=$phonepe&pn=Merchant&mc=1234&tr=123456789&tn=Payment&am=${widget.totalAmount.toStringAsFixed(2)}&cu=INR",
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
      body: SingleChildScrollView(
        child: Column(
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
                          //     boxShadow: [
                          // BoxShadow(
                          //   // color: Colors.grey.withOpa/city(0.5),
                          //   // spreadRadius: 2,
                          //   // blurRadius: 5,
                          //   // offset: Offset(0, 3)
                          // )
                          //                     ]
                            ),
                            child: Image.asset('images/googlepay.png',fit: BoxFit.fill,),
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
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 20),
                  //   child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: [
                  //       Container(
                  //         height: 40,
                  //         width: 50,
                  //         decoration: BoxDecoration(
                  //           boxShadow: [
                  //             BoxShadow(
                  //               spreadRadius: 0.02,
                  //               blurRadius: 0.02, 
                  //             )
                  //           ],
                  //           borderRadius: BorderRadius.circular(20),
                  //           color: Colors.white,
                            
                  //         ),
                  //         child: Image.asset('images/cash.png',fit: BoxFit.contain,),
                  //       ),
                  //       CustomText(text: 'Cash on Delivery', size: 18,weight: FontWeight.w600,),
                  //        Radio<String>(
                  //         value: "Cash on Delivery",
                  //         groupValue: _selectedPaymentMethod,
                  //         onChanged: (String? value) {
                  //           setState(() {
                  //             _selectedPaymentMethod = _selectedPaymentMethod == value ? null : value;
                  //           });
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: 20,),
                  // GestureDetector(
                  //   onTap: () {
                  //     showDialog(context: context, 
                  //     builder: (context) => AlertDialog(
                  //       backgroundColor: Colors.white,
                  //       title: CustomText(text: 'Razor Payment Gateway', size: 20,color: Colors.black,),
                  //       content: Custom_TextField(
                  //         controller: amtController,
                  //         hintText: 'emter the amount',
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //         ),
                  //         validator: (value) {
                  //           if(value == null || value.isEmpty){
                  //             return 'please enter amount to be paid';
                  //           }
                  //           return null;
                  //         },
                  //       ),
                  //       actions: [
                  //         ElevatedButton(onPressed: () {
                  //           if(amtController.text.toString().isNotEmpty){
                  //             setState(() {
                  //               int amount = int.parse(amtController.text.toString());
                  //               openCheckout(amount);
                  //             });
                  //           }
                  //         }, child: CustomText(text: 'Make Payment', size: 14, color: Colors.white,),
                  //         style: ElevatedButton.styleFrom(
                  //           backgroundColor: Colors.green,
                  //           disabledForegroundColor: Colors.white
                  //         ),
                  //         )
                  //       ],
                  //     ));
                  //   },
                  //   child: Container(
                  //     width: 350,
                  //     height: 60,
                  //     // color: Colors.amber,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10),
                  //       color: Colors.white,
                  //       // boxShadow: List.filled(3, BoxShadow(
                  //       //   color: Colors.black.withOpacity(0.5),
                  //       //   blurRadius: 1,
                  //       //   offset: Offset(0, 1)
                  //       // ))
                  //     ),
                  //     child: Center(child: Row(
                  //       children: [
                  //         const Padding(
                  //           padding: EdgeInsets.all(8.0),
                  //           child: CircleAvatar(
                  //             backgroundImage: AssetImage('images/Razorpay.jpg'),
                  //           ),
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(left:55),
                  //           child: CustomText(text: 'RazorPayMent', size: 20, weight: FontWeight.w600,),
                  //         ),
                  //       ],
                  //     )),
                  //   ),
                  // ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.grey),
                      
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('images/cash.png'),
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: CustomText(text: 'Cash On Delivery', size: 18,weight: FontWeight.w600,),
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black)
                        ),
                       onTap: () {
                         showDialog(context: context, builder: (context) => AlertDialog(
                          
                          title: CustomText(text: 'Confirm Cash on Delivery', size: 18,weight: FontWeight.w600,),
                          content: CustomText(text: 'Pay via UPI or Cash when you receive your order', size: 16,color: Colors.indigoAccent,),
                          actions: [
                            ElevatedButton(
                              
                              onPressed: () {
                              
                            }, child: Text('Cancel')),
                            SizedBox(width: 10,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber
                              ),
                              onPressed: () {
                              // submitOrder();
                            }, child: Text('Confirm order'))
                          ],

                         ),);
                       },
                       
                      
                      ),
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
      ),
    );
  }
}