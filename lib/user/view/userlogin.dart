// ignore_for_file: prefer_const_constructors

import 'package:drugcart/user/controller/user_Login_Model.dart';
import 'package:drugcart/user/model/user_login_model.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:drugcart/provider/password_provider.dart';
import 'package:drugcart/user/view/bottomnav.dart';
import 'package:drugcart/user/view/forgot_password.dart';
import 'package:drugcart/user/view/user_register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final User_LoginController _user_loginController = User_LoginController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final suffixicons = Provider.of<PasswordProvider>(context);
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
                                        controller: emailcontroller,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 2,color: kgreyColor),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          filled: true,
                                          fillColor: kcontentColor,
                                          hintText: 'enter  username',
                                          helperStyle: TextStyle(color: kgreyColor)
                                        ),validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'enter email correctly';
                                            }
                                            return null;
                                          },
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
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 2,color: kgreyColor),
                                            borderRadius: BorderRadius.circular(15),
                                            
                                          ),
                                          
                                          filled: true,
                                          fillColor: kcontentColor,
                                          hintText: 'enter  password',
                                          helperStyle: TextStyle(color: kgreyColor),
                                          suffixIcon: IconButton(onPressed: () {
                                            suffixicons.checking();
                                          }, icon: suffixicons.checked?
                                           const Icon(Icons.visibility_off_outlined):Icon(
                                            Icons.visibility_outlined))
                                        ),
                                        obscureText: suffixicons.checked,
                                        validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'password incorrect';
                                            }
                                            return null;
                                          },
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Forgot_Passeord(),));
                            }, child: CustomText(text: 'Forgot Password?', size: 16, weight: FontWeight.normal, color: Colors.blue)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: Center(
                              child: SizedBox(
                                height: 55,
                                width: 260,
                                child: ElevatedButton(onPressed: () {
                                  if(_formkey.currentState!.validate()){
                                    User_Login_Model userlogin = User_Login_Model(
                                      email: emailcontroller.text,
                                      password: passwordcontroller.text
                                    );
                                    _user_loginController.loginUser(userlogin, context);
                                    emailcontroller.clear();
                                    passwordcontroller.clear();
                                  }
                                }, 
                                 style: ElevatedButton.styleFrom(
                                 backgroundColor: kpinkcolor,
                                ),
                                child: CustomText(text: "Login", size: 25, weight: FontWeight.bold, color: Colors.white)),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: MediaQuery.of(context).size.height * 0.33 ,
                            right: (screenWidth - 325) / 2,
                            child: Row(
                              children: [
                                CustomText(text: 'Don’t have an account?', size: 16, weight: FontWeight.normal, color: Colors.black),
                                TextButton(onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => UserRegister(),));
                              }, child: CustomText(text: 'Sign Up', size: 16, weight: FontWeight.normal, color: Colors.blue)),
                              ],
                            ),
                          ),
                      Align(
                        alignment: Alignment(1, 0.35),
                        child: Row(
                        children: [
                        Expanded(child: Divider(thickness: 3,)),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 5.w),
                          child: CustomText(text: 'or', size: 15.sp),
                        ),
                         Expanded(child: Divider(thickness: 3,)),
                              ],
                            ),
                      ),
                          Positioned(
                            bottom: MediaQuery.of(context).size.height * 0.22,
                            right: (screenWidth - 270) / 2,
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
      ),
    );
  }
}
