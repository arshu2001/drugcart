import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/admin/home.dart';
import 'package:drugcart/user/model/user_login_model.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:drugcart/user/view/bottomnav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class User_LoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> loginUser(
    User_Login_Model loginmodel, BuildContext context)async{
      try {
        //First, check if the email exists in the ChefAuth collection
        QuerySnapshot userSnapshot = await _firestore
        .collection('Users').where('email', isEqualTo: loginmodel.email)
        .get();

        if(userSnapshot.docs.isEmpty){
          throw FirebaseAuthException(code: 'user-not-found',
          message: 'No user found with this email.');
        }
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: loginmodel.email!, password: loginmodel.password!);
          Navigator.push(context, MaterialPageRoute(builder: (context) => BottonNav(),));
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