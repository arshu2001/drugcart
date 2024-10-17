import 'package:drugcart/delivery_boy.dart/modal/delivery_login_modal.dart';
import 'package:drugcart/delivery_boy.dart/view/delivery_bottomnav.dart';
import 'package:drugcart/delivery_boy.dart/view/bottomnav/delivery_home.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Delivery_Login_Controller{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> loginDelivery(
    Delivery_Login_Model delloginmodal, BuildContext context)async{
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: delloginmodal.email!, password: delloginmodal.password!);
          Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryBottomnav(),));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: CustomText(text: "Login success", size: 18)));
      return;

      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: CustomText(text: "Error : ${e.toString()}", size: 18))
        );

      }
    }
}