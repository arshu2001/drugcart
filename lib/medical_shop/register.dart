import 'package:drugcart/widget/constants.dart';
import 'package:drugcart/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MedicalRegister extends StatefulWidget {
  const MedicalRegister({super.key});

  @override
  State<MedicalRegister> createState() => _MedicalRegisterState();
}

class _MedicalRegisterState extends State<MedicalRegister> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 234, 186, 186),
        body: SingleChildScrollView(
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
              ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40,top: 10),
                        child: CustomText(text: 'Password', size: 18, weight: FontWeight.normal, color: Colors.white),
                      ),
                      Center(
                        child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 2,color: kgreyColor),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      filled: true,
                                      fillColor: kcontentColor,
                                      hintText: 'enter  Password',
                                      helperStyle: TextStyle(color: kgreyColor)
                                    ),
                                  ),
                                ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40,top: 10),
                        child: CustomText(text: 'Address', size: 18, weight: FontWeight.normal, color: Colors.white),
                      ),
                      Center(
                        child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 2,color: kgreyColor),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      filled: true,
                                      fillColor: kcontentColor,
                                      hintText: 'enter  Address',
                                      helperStyle: TextStyle(color: kgreyColor)
                                    ),
                                  ),
                                ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40,top: 10),
                        child: CustomText(text: 'phone no', size: 18, weight: FontWeight.normal, color: Colors.white),
                      ),
                      Center(
                        child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 2,color: kgreyColor),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      filled: true,
                                      fillColor: kcontentColor,
                                      hintText: 'enter  phone number',
                                      helperStyle: TextStyle(color: kgreyColor)
                                    ),
                                  ),
                                ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40,top: 10),
                        child: CustomText(text: 'shop license number', size: 18, weight: FontWeight.normal, color: Colors.white),
                      ),
                      Center(
                        child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 2,color: kgreyColor),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      filled: true,
                                      fillColor: kcontentColor,
                                      hintText: 'enter shop license number',
                                      helperStyle: TextStyle(color: kgreyColor)
                                    ),
                                  ),
                                ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40,top: 10),
                        child: CustomText(text: 'email', size: 18, weight: FontWeight.normal, color: Colors.white),
                      ),
                      Center(
                        child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 2,color: kgreyColor),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      filled: true,
                                      fillColor: kcontentColor,
                                      hintText: 'enter  email',
                                      helperStyle: TextStyle(color: kgreyColor)
                                    ),
                                  ),
                                ),
                      ),
                     Padding(
                       padding: const EdgeInsets.only(left: 40,top: 10),
                       child: CustomText(text: 'shop name', size: 18, weight: FontWeight.normal, color: Colors.white),
                     ),
                      Center(
                        child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 2,color: kgreyColor),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      filled: true,
                                      fillColor: kcontentColor,
                                      hintText: 'enter  shop name',
                                      helperStyle: TextStyle(color: kgreyColor)
                                    ),
                                  ),
                                ),
                      ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.080,
                                    width: MediaQuery.of(context).size.width * 0.7,
                                    child: ElevatedButton(onPressed: () {
                                      
                                    }, child: CustomText(text: 'Submit', size: 32, weight: FontWeight.bold, color: Colors.grey)),
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