import 'package:drugcart/user/view/payment.dart';
import 'package:drugcart/user/model/widget/custom_textfield.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Add_Address extends StatefulWidget {
  const Add_Address({super.key});

  @override
  State<Add_Address> createState() => _Add_AddressState();
}

class _Add_AddressState extends State<Add_Address> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Add Address', size: 18,weight: FontWeight.bold,),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'Deliver to', size: 16,color: Colors.grey,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Custom_TextField(
                  hintText: 'Name',
                ),
              ),
              const SizedBox(height: 20,),
               CustomText(text: 'Mobile Number', size: 16,color: Colors.grey,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Custom_TextField(
                  hintText: 'Enter Number',
                ),
              ),
              const SizedBox(height: 20,),
               CustomText(text: 'Pincode', size: 16,color: Colors.grey,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Custom_TextField(
                  hintText: 'Enter Pincode',
                ),
              ),
              const SizedBox(height: 20,),
               CustomText(text: 'Address', size: 16,color: Colors.grey,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Custom_TextField(
                  maxLines: 5,
                  hintText: 'Enter Address',
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.87,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green
                        ),
                        onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(),));
                      }, child: CustomText(text: 'Submit', size: 24, weight: FontWeight.bold, color: Colors.white)),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}