import 'package:drugcart/medical_shop/home.dart';
import 'package:drugcart/medical_shop/register.dart';
import 'package:drugcart/model/constants.dart';
import 'package:drugcart/model/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MedicalLogin extends StatefulWidget {
  const MedicalLogin({super.key});

  @override
  State<MedicalLogin> createState() => _MedicalLoginState();
}

class _MedicalLoginState extends State<MedicalLogin> {
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
                    height: screenHeight,
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
                        Positioned(
                          bottom: MediaQuery.of(context).size.height * 0.5 ,
                          right: (screenWidth - 325) / 2,
                          child: TextButton(onPressed: () {
                            
                          }, child: CustomText(text: 'Forgot Password?', size: 16, weight: FontWeight.normal, color: Colors.blue)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Center(
                            child: SizedBox(
                              height: 65,
                              width: 260,
                              child: ElevatedButton(onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalHome(),));
                              }, 
                               style: ElevatedButton.styleFrom(
                               backgroundColor: kpinkcolor,
                              ),
                              child: CustomText(text: "Login", size: 36, weight: FontWeight.bold, color: Colors.black)),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: MediaQuery.of(context).size.height * 0.33 ,
                          right: (screenWidth - 325) / 2,
                          child: Row(
                            children: [
                              CustomText(text: 'Don’t have an account', size: 16, weight: FontWeight.normal, color: Colors.black),
                              TextButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalRegister(),));
                            }, child: CustomText(text: 'Sign Up', size: 16, weight: FontWeight.normal, color: Colors.blue)),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: MediaQuery.of(context).size.height * 0.24,
                          right: (screenWidth - 250) / 2,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.080,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black
                              ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircleAvatar(backgroundImage: AssetImage("images/googleicon.jpeg"),),
                                CustomText(text: 'Login with Google', size: 16, weight: FontWeight.normal, color: Colors.black)
                              ],
                            ),
                          ),
                        )
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