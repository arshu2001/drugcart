import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/medical_shop/model/midical_login_modal.dart';
import 'package:drugcart/medical_shop/view/home.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Medicine_Login_Controller{
  final FirebaseAuth _auth = FirebaseAuth.instance;
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> loginMedical(Medical_Login_Model loginmodal,BuildContext context)async{
    try {

      showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing the dialog
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

      //First, check if the email exists in the ChefAuth collection
        QuerySnapshot userSnapshot = await _firestore
        .collection('Medicine').where('email', isEqualTo: loginmodal.email)
        .get();

        if(userSnapshot.docs.isEmpty){
          throw FirebaseAuthException(code: 'Medical-shop-not-found',
          message: 'No Medical shop found with this email.');
        }    
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: loginmodal.email!,
         password: loginmodal.password!);
         Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalHome(),));
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