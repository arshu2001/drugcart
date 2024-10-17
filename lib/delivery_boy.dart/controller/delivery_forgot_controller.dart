import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/delivery_boy.dart/modal/delivery_forgot_modal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Delivery_Forgot_Controller{
  final _auth = FirebaseAuth.instance;

  Future<void> deliverypassreset(
    Delivery_Forgot_Model deliveryforgot,BuildContext context)async{
      try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('DeliveryBoy')
        .where('email', isEqualTo: deliveryforgot.email)
        .get();

        if(querySnapshot.docs.isNotEmpty){
          await _auth.sendPasswordResetEmail(email: deliveryforgot.email!.trim());
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password reset email sent'))
          );
          await _auth.currentUser!.updatePassword(deliveryforgot.email!);
           ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password updated successfully')),
          );
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No User account found with this email')),
          );
        }
      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('An Unexpected error occurred')),
          );
      }
    }
}