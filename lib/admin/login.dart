import 'package:drugcart/admin/home.dart';
import 'package:drugcart/model/constants.dart';
import 'package:drugcart/model/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 199, 128, 128),
          body: Column(crossAxisAlignment: CrossAxisAlignment.center,
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
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 2,color: kgreyColor),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          filled: true,
                                          fillColor: kcontentColor,
                                          hintText: 'enter  username',
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
                                height: MediaQuery.of(context).size.height * 0.080,
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: ElevatedButton(onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHome(),));
                                }, 
                                 style: ElevatedButton.styleFrom(
                                 backgroundColor: kpinkcolor,
                                ),
                                child: CustomText(text: "Login", size: 36, weight: FontWeight.bold, color: Colors.black)),
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
    );
  }
}