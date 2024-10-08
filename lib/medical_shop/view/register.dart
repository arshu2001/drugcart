import 'package:drugcart/medical_shop/controller/medicine_register_controller.dart';
import 'package:drugcart/medical_shop/model/medical_register_model.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/custom_textfield.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MedicalRegister extends StatefulWidget {
  const MedicalRegister({super.key});

  @override
  State<MedicalRegister> createState() => _MedicalRegisterState();
}

class _MedicalRegisterState extends State<MedicalRegister> {
  final _formkey = GlobalKey<FormState>();
  final _namecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _licensecontroller = TextEditingController();
  final _phonecontroller = TextEditingController();
  final _shopenamecontroller = TextEditingController();

  final medicine_Register_Controller _medicine_register_controller = medicine_Register_Controller();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF009688),
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
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
                            hintText: 'enter your name',
                            filled: true,
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Please enter your name";
                              }
                              return null;
                            },

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
                          child: CustomText(text: 'Address', size: 18, weight: FontWeight.normal, color: Colors.white),
                        ),
                        Center(
                          child: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    child: Custom_TextField(
                                      controller: _addresscontroller,
                                      hintText: "enter your address",
                                      filled: true,
                                      validator: (value){
                                        if(value == null || value.isEmpty){
                                          return "Please enter your address";
                                        }
                                        return null;
                                      },

                                    )
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40,top: 10),
                          child: CustomText(text: 'phone no', size: 18, weight: FontWeight.normal, color: Colors.white),
                        ),
                        Center(
                          child: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    child: Custom_TextField(
                                      controller: _phonecontroller,
                                      hintText: 'enter your phone number',
                                      filled: true,
                                      validator: (value){
                                        if(value == null || value.isEmpty){
                                          return "Please enter your phone number";
                                        }
                                        return null;
                                      },

                                    )
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40,top: 10),
                          child: CustomText(text: 'shop license number', size: 18, weight: FontWeight.normal, color: Colors.white),
                        ),
                        Center(
                          child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                    child: Custom_TextField(
                                      controller: _licensecontroller,
                                      hintText: "enter the license number",
                                      filled: true,
                                      validator: (value){
                                        if(value == null || value.isEmpty){
                                          return "Please enter your license number";
                                        }
                                        return null;
                                      },

                                    )
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40,top: 10),
                          child: CustomText(text: 'email', size: 18, weight: FontWeight.normal, color: Colors.white),
                        ),
                        Center(
                          child: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    child: Custom_TextField(
                                      controller: _emailcontroller,
                                      filled: true,
                                      hintText: 'enter your email',
                                      validator: (value){
                                        if(value == null || value.isEmpty){
                                          return "Please enter your emil";
                                        }
                                        return null;
                                      },

                                    )
                                  ),
                        ),
                       Padding(
                         padding: const EdgeInsets.only(left: 40,top: 10),
                         child: CustomText(text: 'shop name', size: 18, weight: FontWeight.normal, color: Colors.white),
                       ),
                        Center(
                          child: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    child: Custom_TextField(
                                      controller: _shopenamecontroller,
                                      filled: true,
                                      hintText: 'enter your shop name',
                                    )
                                  ),
                        ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SizedBox(
                                      height: MediaQuery.of(context).size.height * 0.080,
                                      width: MediaQuery.of(context).size.width * 0.7,
                                      child: ElevatedButton(onPressed: () {
                                        if(_formkey.currentState!.validate()){
                                          Medical_Register_Modal medicinereg = Medical_Register_Modal(
                                            name: _namecontroller.text,
                                            password: _passwordcontroller.text,
                                            email: _emailcontroller.text,
                                            address: _addresscontroller.text,
                                            licensenumber: _licensecontroller.text,
                                            phone: _phonecontroller.text,
                                            shopname: _shopenamecontroller.text
                                          );
                                          _medicine_register_controller.medicineregister(medicinereg, context);
                                          _namecontroller.clear();
                                          _passwordcontroller.clear();
                                          _addresscontroller.clear();
                                          _emailcontroller.clear();
                                          _licensecontroller.clear();
                                          _phonecontroller.clear();
                                          _shopenamecontroller.clear();
                                        }
                                      }, child: CustomText(text: 'Submit', size: 32, weight: FontWeight.bold, color: Colors.grey)),
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