import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/user/model/user_forgot_Model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class user_forgot_controller{
  final _auth = FirebaseAuth.instance;

  Future<void> userpassrest(
    User_Forgot_Model userforgot,BuildContext context)async{
      try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance.
        collection('Users').
        where('email',isEqualTo: userforgot.email)
        .get();
        if(querySnapshot.docs.isNotEmpty){
          await _auth.sendPasswordResetEmail(email: userforgot.email!.trim());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password reset email sent'))
          );
            await _auth.currentUser!.updatePassword(userforgot.email!);
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