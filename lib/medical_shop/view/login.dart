import 'package:drugcart/medical_shop/controller/medicine_login_controller.dart';
import 'package:drugcart/medical_shop/model/midical_login_modal.dart';
import 'package:drugcart/medical_shop/view/home.dart';
import 'package:drugcart/medical_shop/view/register.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/custom_textfield.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:drugcart/provider/password_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MedicalLogin extends StatefulWidget {
  const MedicalLogin({super.key});

  @override
  State<MedicalLogin> createState() => _MedicalLoginState();
}

class _MedicalLoginState extends State<MedicalLogin> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final Medicine_Login_Controller _medicine_login_controller = Medicine_Login_Controller();
  @override
  Widget build(BuildContext context) {
    final suffixicons = Provider.of<PasswordProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF00796B),
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
                              height: 255,
                              width: 330,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color(0xFF009688)
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
                                      width: MediaQuery.of(context).size.width * 0.75,
                                      height: screenHeight * 0.1,
                                      child: Custom_TextField(
                                        controller: emailcontroller,
                                        filled: true,
                                        hintText: 'enter your email',
                                        validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'enter email correctly';
                                            }
                                            return null;
                                          },

                                      )
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: CustomText(text: 'password', size: 18, weight: FontWeight.normal, color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.75,
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
                                              return 'enter password correctly';
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
                              
                            }, child: CustomText(text: 'Forgot Password?', size: 16, weight: FontWeight.normal, color: Colors.blue)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 80),
                            child: Center(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height * 0.060,
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: ElevatedButton(onPressed: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalHome(),));
                                  if(_formkey.currentState!.validate()){
                                    Medical_Login_Model loginmodal = Medical_Login_Model(
                                      email: emailcontroller.text,
                                      password: passwordcontroller.text
                                    );
                                    _medicine_login_controller.loginMedical(loginmodal, context);
                                    emailcontroller.clear();
                                    passwordcontroller.clear();
                                  }
                                }, 
                                 style: ElevatedButton.styleFrom(
                                 backgroundColor: Color(0xFF009688),
                                ),
                                child: CustomText(text: "Login", size: 20, weight: FontWeight.bold, color: Colors.white)),
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalRegister(),));
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