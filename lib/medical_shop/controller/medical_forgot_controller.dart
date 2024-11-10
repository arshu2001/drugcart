import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/medical_shop/model/medical_forgot.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Medical_Forgot_Controller{
  final _auth = FirebaseAuth.instance;

  Future<void> medicalpassrest(
    Medical_Forgot_Model medicalforgot,BuildContext context) async{
      try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('approvedMedical')
        .where('email',isEqualTo: medicalforgot.email)
        .get();
        if(querySnapshot.docs.isNotEmpty){
          await _auth.sendPasswordResetEmail(email: medicalforgot.email!.trim());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password reset email sent'))
          );
            await _auth.currentUser!.updatePassword(medicalforgot.email!);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password updated successfully')),
      );
        }else{
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No User account found with this email')),
          );
        }

      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('An Unexpected error occurred')),
          );
      }
    }
}