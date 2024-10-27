import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/admin/home.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final TextEditingController emailcontroller=TextEditingController();
  final TextEditingController passwordcontroller=TextEditingController();
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _formkey = GlobalKey<FormState>();

  Future<void> adminLogin() async{
    try {
      String email = emailcontroller.text.trim();
      String password = passwordcontroller.text.trim();

      // Query the AdminAuth collection
      QuerySnapshot querySnapshot = await _firestore
          .collection('admin')
          .where('email', isEqualTo: email)
          .get();

          if(querySnapshot.docs.isNotEmpty){
            String storedPassword = querySnapshot.docs.first['password'];
            if(password == storedPassword){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHome(),));

              ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: CustomText(text: 'Login Success', size: 18.spMin)),
          );
          return;
            }
          }
          ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: CustomText(text: "Invalid email or password", size: 18.spMin)),
          );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: CustomText(text: "Error: $e", size: 18.spMin)),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 199, 128, 128),
          body: Form(
            key: _formkey,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Image.asset('images/appicon-removebg-preview.png',width:130,height:130 ,)),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: screenWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),topRight: Radius.circular(40)
                            ),
                            color: kcontentColor
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: MediaQuery.of(context).size.height * 0.1,
                              left: (screenWidth - 325) / 2, 
                              child: Container(
                                height: 250,
                                width: 330,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: kpinkcolor
                                ),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25),
                                        child: CustomText(text: 'username', size: 18, weight: FontWeight.normal, color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.7,
                                        child: TextFormField(
                                          controller: emailcontroller,
                                          validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'Field cannot be empty';
                                                }
                                                return null;
                                              },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(width: 2,color: kgreyColor),
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            // focusedBorder: OutlineInputBorder(
                                            //   borderSide: BorderSide(
                                            //     color: Colors.black,
                                            //     width: 2.w
                                            //   ),
                                            //   borderRadius: BorderRadius.circular(10)
                                            // ),
                                            // focusedErrorBorder: OutlineInputBorder(
                                            //   borderRadius: BorderRadius.circular(10),
                                            //   borderSide: BorderSide(color: Colors.black)
                                            // ),
                                            // errorBorder: OutlineInputBorder(
                                            //   borderRadius: BorderRadius.circular(10),
                                            //   borderSide: BorderSide(color: Colors.black)
                                            // ),
                                            // enabledBorder: OutlineInputBorder(
                                            //   borderSide: BorderSide(
                                            //     color: Colors.black,
                                            //     width: 2.w
                                            //   ),
                                            //   borderRadius: BorderRadius.circular(10)
                                            // ),
                                            filled: true,
                                            fillColor: kcontentColor,
                                            hintText: 'enter  your email',
                                            helperStyle: TextStyle(color: kgreyColor)
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: CustomText(text: 'password', size: 18, weight: FontWeight.normal, color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.7,
                                        child: TextFormField(
                                          controller: passwordcontroller,
                                          validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'Field cannot be empty';
                                                }
                                                return null;
                                              },
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(width: 2,color: kgreyColor),
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            filled: true,
                                            fillColor: kcontentColor,
                                            hintText: 'enter  password',
                                            helperStyle: TextStyle(color: kgreyColor)
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            
                            Padding(
                              padding: const EdgeInsets.only(top: 250),
                              child: Center(
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.060,
                                  width: MediaQuery.of(context).size.width * 0.7,
                                  child: ElevatedButton(onPressed: () {
                                    if(_formkey.currentState!.validate()){
                                      adminLogin();
                                    }
                                    
                                  }, 
                                   style: ElevatedButton.styleFrom(
                                   backgroundColor: kpinkcolor,
                                  ),
                                  child: CustomText(text: "Login", size: 20, weight: FontWeight.bold, color: Colors.black)),
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
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