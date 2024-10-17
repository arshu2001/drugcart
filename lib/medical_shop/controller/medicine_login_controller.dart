import 'package:drugcart/medical_shop/model/midical_login_modal.dart';
import 'package:drugcart/medical_shop/view/home.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Medicine_Login_Controller{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> loginMedical(Medical_Login_Model loginmodal,BuildContext context)async{
    try {

      showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing the dialog
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    
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