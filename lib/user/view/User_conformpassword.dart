import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/custom_textfield.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/material.dart';

class User_ConformPassword extends StatefulWidget {
  const User_ConformPassword({super.key});

  @override
  State<User_ConformPassword> createState() => _User_ConformPasswordState();
}

class _User_ConformPasswordState extends State<User_ConformPassword> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: kprimaryColor,
            title: CustomText(text: 'Forgot Password', size: 20,weight: FontWeight.bold,),centerTitle: true,
          ),
          
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Image.asset('images/appicon-removebg-preview.png',width:100,height:100 ,),
                      ),
                      SizedBox(
                               width: MediaQuery.of(context).size.width * 0.8,
                               child: Custom_TextField(
                                labelText: CustomText(text: 'Email', size: 16),
                                hintText: 'enter your email',
                                
                               )
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.8,
                                          child: Custom_TextField(
                                            labelText: CustomText(text: 'Password', size: 16),
                                            hintText: 'enter your password',
                                  
                                          )
                                        ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: SizedBox(
                                          width: MediaQuery.of(context).size.width * 0.8,
                                          child: Custom_TextField(
                                            labelText: CustomText(text: 'Conform Password', size: 16),
                                            hintText: 'enter conform password ',
                                          )
                                        ),
                              ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 100),
                                        child: SizedBox(
                                          height: MediaQuery.of(context).size.height * 0.070,
                                          width: MediaQuery.of(context).size.width * 0.7,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: kprimaryColor
                                            ),
                                            onPressed: () {
                                            
                                          }, child: CustomText(text: 'Submit', size: 25, weight: FontWeight.bold, color: Colors.white)),
                                        ),
                                      )
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}