import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:drugcart/delivery_boy.dart/controller/delivery_register_controller.dart';
import 'package:drugcart/delivery_boy.dart/modal/delivery_register.modal.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/custom_textfield.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliveryRegister extends StatefulWidget {
  const DeliveryRegister({super.key});

  @override
  State<DeliveryRegister> createState() => _DeliveryRegisterState();
}

class _DeliveryRegisterState extends State<DeliveryRegister> {
  final _formkey = GlobalKey<FormState>();
  final _namecontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  final _phonecontroller = TextEditingController();
  final Delivery_Register_Controller _delivery_register_controller= Delivery_Register_Controller();
  String? selectedValue;
  String? selectedBike;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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

                        Padding(
                          padding: const EdgeInsets.only(left: 40,top: 10),
                          child: CustomText(text: 'Gender', size: 18, weight: FontWeight.normal, color: Colors.white),
                        ),
                        Center(
                          child: Container(
                            height: 60,
                            width: 310,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black,width: 0.5),
                              color: kcontentColor
                            ),
                            child: FormField<String>(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please select a gender';
                                      }
                                      return null;
                                    },
                                builder: (FormFieldState<String> state) {
                                  return InputDecorator(
                                    decoration: InputDecoration(
                                      errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                                    ),
                                    isEmpty: selectedValue == null,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2<String>(
                                        value: selectedValue,
                                        hint: CustomText(text: 'Selected gender', size: 18),
                                        isExpanded: true,
                                        items: <String>['male', 'female']
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: CustomText(text: value, size: 18),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedValue = value;
                                          });
                                          state.didChange(value);
                                        },
                                        dropdownStyleData: DropdownStyleData(
                                          offset: Offset(0, 10),
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 249, 247, 247),
                                            borderRadius: BorderRadius.circular(10),
                                        )
                                      )
                                    ),
                                    )
                                );
                              },
                              ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40,top: 10),
                          child: CustomText(text: 'Gender', size: 18, weight: FontWeight.normal, color: Colors.white),
                        ),
                        Center(
                          child: Container(
                            height: 60,
                            width: 310,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black,width: 0.5),
                              color: kcontentColor
                            ),
                            child: FormField<String>(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please select yes or no';
                                      }
                                      return null;
                                    },
                                builder: (FormFieldState<String> state) {
                                  return InputDecorator(
                                    decoration: InputDecoration(
                                      errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                                    ),
                                    isEmpty: selectedBike == null,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2<String>(
                                        value: selectedBike,
                                        hint: CustomText(text: 'Bike', size: 18),
                                        isExpanded: true,
                                        items: <String>['Yes', 'No']
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: CustomText(text: value, size: 18),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          setState(() {
                                            selectedBike = value;
                                          });
                                          state.didChange(value);
                                        },
                                        dropdownStyleData: DropdownStyleData(
                                          offset: Offset(0, 10),
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(255, 249, 247, 247),
                                            borderRadius: BorderRadius.circular(10),
                                        )
                                      )
                                    ),
                                    )
                                );
                              },
                              ),
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
                                          Delivery_Register_Model deliveryRegister = Delivery_Register_Model(
                                            name: _namecontroller.text,
                                            password: _passwordcontroller.text,
                                            email: _emailcontroller.text,
                                            address: _addresscontroller.text,
                                            age: _agecontroller.text,
                                            phone: _phonecontroller.text,
                                            gender: selectedValue,
                                            bike: selectedBike,
                                            status: "pending"
                                          );
                                          _delivery_register_controller.deliveryRegister(deliveryRegister, context);
                                          _namecontroller.clear();
                                          _passwordcontroller.clear();
                                          _emailcontroller.clear();
                                          _addresscontroller.clear();
                                          _agecontroller.clear();
                                          _phonecontroller.clear();
                                          selectedValue = null;
                                          selectedBike = null;
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