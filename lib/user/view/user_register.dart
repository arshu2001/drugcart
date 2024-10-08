import 'package:drugcart/user/controller/user_register_controller.dart';
import 'package:drugcart/user/model/user_register_model.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/custom_textfield.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final _formkey = GlobalKey<FormState>();
  final _namecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  final _phonecontroller = TextEditingController();
  final User_RegisterController _userController = User_RegisterController();
  
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 234, 186, 186),
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset('images/appicon-removebg-preview.png',width:100,height:100 ,)),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: CustomText(text: 'username', size: 18, weight: FontWeight.normal, color: Colors.white),
                ),
                Center(
                  child: SizedBox(
                           width: MediaQuery.of(context).size.width * 0.8,
                           child: Custom_TextField(
                            controller: _namecontroller,
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Please enter your name";
                              }
                              return null;
                            },
                            hintText: 'enter user name',
                            fillColor: kcontentColor,
                            filled: true,
                           )
                          ),
                ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40,top: 10),
                          child: CustomText(text: 'Password', size: 18, weight: FontWeight.normal, color: Colors.white),
                        ),
                        Center(
                          child: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    child: Custom_TextField(
                                      controller: _passwordcontroller,
                                      hintText: 'enter password',
                                      filled: true,
                                      fillColor: kcontentColor,
                                      validator: (value){
                                         if(value == null || value.isEmpty){
                                            return "Please enter your password";
                                          }
                                           return null;
                                        },
                                    )
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40,top: 10),
                          child: CustomText(text: 'Email', size: 18, weight: FontWeight.normal, color: Colors.white),
                        ),
                        Center(
                          child: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    child: Custom_TextField(
                                      controller: _emailcontroller,
                                      hintText: 'enter Email',
                                      filled: true,
                                      fillColor: kcontentColor,
                                      validator: (value){
                                        if(value == null || value.isEmpty || !value.contains('@')){
                                          return "enter email correctly";
                                        }
                                        return null;
                                      },
                                      
                                    )
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40,top: 10),
                          child: CustomText(text: 'Address', size: 18, weight: FontWeight.normal, color: Colors.white),
                        ),
                        Center(
                          child: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    child: Custom_TextField(
                                      controller: _addresscontroller,
                                      hintText: 'enter your address',
                                      maxLines: 5,
                                      filled: true,
                                      fillColor: kcontentColor,
                                      validator: (value){
                                        if(value == null || value.isEmpty){
                                          return "Please enter your Address";
                                        }
                                        return null;
                                      },

                                    )
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40,top: 10),
                          child: CustomText(text: 'Age', size: 18, weight: FontWeight.normal, color: Colors.white),
                        ),
                        Center(
                          child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                    child: Custom_TextField(
                                      keyboardType: const TextInputType.numberWithOptions(),
                                      controller: _agecontroller,
                                      hintText: 'enter your age',
                                      filled: true,
                                      fillColor: kcontentColor,
                                      validator: (value){
                                        if(value == null || value.isEmpty){
                                          return "Please enter your Age";
                                        }
                                        return null;
                                      },
                                    )
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40,top: 10),
                          child: CustomText(text: 'Phone no', size: 18, weight: FontWeight.normal, color: Colors.white),
                        ),
                        Center(
                          child: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    child: Custom_TextField(
                                      keyboardType: const TextInputType.numberWithOptions(),
                                      controller: _phonecontroller,
                                      hintText: 'enter your phone nymber',
                                      filled: true,
                                      fillColor: kcontentColor,
                                      validator: (value){
                                        if(value == null || value.isEmpty){
                                          return "Please enter your Phone number";
                                        }
                                        return null;
                                      },
                                    )
                                  ),
                        ),
                       
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.070,
                                      width: MediaQuery.of(context).size.width * 0.7,
                                      child: ElevatedButton(onPressed: () {
                                        if(_formkey.currentState!.validate()){
                                          user_register_Model userreg = user_register_Model(
                                            name: _namecontroller.text,
                                            password: _passwordcontroller.text,
                                            emaill: _emailcontroller.text,
                                            address: _addresscontroller.text,
                                            age: _agecontroller.text,
                                            phone: _phonecontroller.text
                                          );
                                          _userController.registerUser(userreg, context);
                                          _namecontroller.clear();
                                          _passwordcontroller.clear();
                                          _emailcontroller.clear();
                                          _addresscontroller.clear();
                                          _agecontroller.clear();
                                          _phonecontroller.clear();
                                        }
                                      }, child: CustomText(text: 'Submit', size: 25, weight: FontWeight.bold, color: Colors.grey)),
                                    ),
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