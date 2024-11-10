import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/delivery_boy.dart/modal/delivery_register.modal.dart';
import 'package:drugcart/delivery_boy.dart/view/delivery_login.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Delivery_Register_Controller{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> deliveryRegister(
    Delivery_Register_Model deliveryRegister,BuildContext context)async{
      try {
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: deliveryRegister.email!, password: deliveryRegister.password!);
          await _firestore.collection('DeliveryBoyReq').doc(userCredential.user!.uid)
          .set({
            "name" : deliveryRegister.name,
            "password" : deliveryRegister.password,
            "email" : deliveryRegister.email,
            "address" : deliveryRegister.address,
            "age" : deliveryRegister.age,
            "phone" : deliveryRegister.phone,
            "gender" : deliveryRegister.gender,
            "bike" : deliveryRegister.bike,
            "status":deliveryRegister.status,
            "uid" : userCredential.user!.uid
          });
          Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryLogin(),));
          ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: CustomText(text: "Registration successful", size: 18.spMin))
        );
        return;
      } catch (e) {
        print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(text: "Registration faild: ${e.toString()} ", size: 18.spMin))
        );
        return;
      }
    }
}