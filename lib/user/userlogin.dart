// ignore_for_file: prefer_const_constructors

import 'package:drugcart/model/customtext.dart';
import 'package:drugcart/user/bottomnav.dart';
import 'package:drugcart/user/user_register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 199, 128, 128),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // Centered Image at the top
              Positioned(
                top: MediaQuery.of(context).size.height * 0.05, // Adjust the top position as needed
                left: 0,
                right: 0,
                child: Center(
                  child: Image.asset(
                    'images/appicon-removebg-preview.png',
                    width: 140,
                    height: 140,
                  ),
                ),
              ),
              // Container at the bottom with a SingleChildScrollView inside
              Padding(
                padding: const EdgeInsets.only(top: 220),
                child: Container(
                  height: 516,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Center(child: CustomText(text: 'Login', size: 40, weight: FontWeight.bold, color: Colors.black)),
                             Positioned(
                top: MediaQuery.of(context).size.height * 0.1,
                left: (screenWidth - 350) / 2, // Center the container horizontally
                child: Container(
                  height: 270,
                  width: 350,
                  // color: Colors.amber,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 237, 179, 179),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 25),
                        child: CustomText(text: 'username', size: 18, weight: FontWeight.normal, color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 10),
                        child: SizedBox(
                          width: 300,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ) ,
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "enter username"
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 10),
                        child: CustomText(text: 'password', size: 18, weight: FontWeight.normal, color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 10),
                        child: SizedBox(
                          width: 300,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ) ,
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "enter password"
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(onPressed: () {
                              
                           }, child: Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 360),
                                child: CustomText(text: 'Forgot Password?', size: 16, weight: FontWeight.normal, color: Colors.blue),
                              ))),
                Positioned(
                top: MediaQuery.of(context).size.height * 0.55,
                left: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 237, 179, 179)
                  ),
                  onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserRegister(),));
                },
                  child: SizedBox(
                  height: 65,
                  width: 260,
                  child: Center(child: CustomText(text: "Login", size: 36, weight: FontWeight.w900, color: Colors.black)))),
              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 490),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomText(text: 'Don’t have an account?', size: 16, weight: FontWeight.normal, color: Colors.black),
                                    TextButton(onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => BottonNav(),));
                                    }, child: CustomText(text: 'Sign up', size: 18, weight: FontWeight.normal, color: Colors.blue))
                                  ],
                                ),
                              ),
                              
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
             
              // login button
             
            ],
          ),
        ),
      ),
    );
  }
}
