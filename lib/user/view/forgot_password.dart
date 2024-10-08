import 'package:drugcart/user/controller/user_forgot_controller.dart';
import 'package:drugcart/user/model/user_forgot_Model.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/custom_textfield.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:drugcart/user/view/User_conformpassword.dart';
import 'package:flutter/material.dart';

class Forgot_Passeord extends StatefulWidget {
  const Forgot_Passeord({super.key});

  @override
  State<Forgot_Passeord> createState() => _Forgot_PasswordState();
}

class _Forgot_PasswordState extends State<Forgot_Passeord> {
  final _emailcontroller = TextEditingController();
  final user_forgot_controller  _userforgetcontroller = user_forgot_controller();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kprimaryColor,
          title: CustomText(text: 'Forgot Password', size: 20,weight: FontWeight.bold,),centerTitle: true,
        ),
        
          body: Form(
            key: _formkey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image.asset('images/appicon-removebg-preview.png',width:100,height:100 ,),
                  SizedBox(
                           width: MediaQuery.of(context).size.width * 0.8,
                           child: Custom_TextField(
                            controller: _emailcontroller,
                            labelText: CustomText(text: 'Email', size: 16),
                            hintText: 'enter your name',
                            
                           )
                          ),
                          
                                  Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.080,
                                      width: MediaQuery.of(context).size.width * 0.7,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: kprimaryColor
                                        ),
                                        onPressed: () {
                                          if(_formkey.currentState!.validate()){
                                            User_Forgot_Model userforgot = User_Forgot_Model(
                                              email: _emailcontroller.text
                                            );
                                            _userforgetcontroller.userpassrest(userforgot, context);
                                          }
                                        
                                      }, child: CustomText(text: 'Submit', size: 25, weight: FontWeight.bold, color: Colors.white)),
                                    ),
                                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}