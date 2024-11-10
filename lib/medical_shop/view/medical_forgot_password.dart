import 'package:drugcart/medical_shop/controller/medical_forgot_controller.dart';
import 'package:drugcart/medical_shop/model/medical_forgot.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/custom_textfield.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MedicalForgot extends StatefulWidget {
  const MedicalForgot({super.key});

  @override
  State<MedicalForgot> createState() => _MedicalForgotState();
}

class _MedicalForgotState extends State<MedicalForgot> {
  final _emailcontroller = TextEditingController();
  final Medical_Forgot_Controller  _medicalforgetcontroller = Medical_Forgot_Controller();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                                            Medical_Forgot_Model userforgot = Medical_Forgot_Model(
                                              email: _emailcontroller.text
                                            );
                                            _medicalforgetcontroller.medicalpassrest(userforgot, context);
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