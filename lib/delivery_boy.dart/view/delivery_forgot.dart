import 'package:drugcart/delivery_boy.dart/controller/delivery_forgot_controller.dart';
import 'package:drugcart/delivery_boy.dart/modal/delivery_forgot_modal.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/custom_textfield.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliveryForgot extends StatefulWidget {
  const DeliveryForgot({super.key});

  @override
  State<DeliveryForgot> createState() => _DeliveryForgotState();
}

class _DeliveryForgotState extends State<DeliveryForgot> {
  final _emailcontroller = TextEditingController();
  final Delivery_Forgot_Controller _delivery_forgot_controller = Delivery_Forgot_Controller();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                            Delivery_Forgot_Model userforgot = Delivery_Forgot_Model(
                                              email: _emailcontroller.text
                                            );
                                            _delivery_forgot_controller.deliverypassreset(userforgot, context);
                                          }
                                        
                                      }, child: CustomText(text: 'Submit', size: 25, weight: FontWeight.bold, color: Colors.white)),
                                    ),
                                  )
                ],
              ),
            ),
          ),
    );
  }
}