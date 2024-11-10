import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/medical_shop/model/midical_login_modal.dart';
import 'package:drugcart/medical_shop/view/home.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Medicine_Login_Controller{
  final FirebaseAuth _auth = FirebaseAuth.instance;
   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> loginMedical(
    Medical_Login_Model delloginmodal, BuildContext context)async{
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: delloginmodal.email!, password: delloginmodal.password!);

          String dboyId = userCredential.user!.uid;

          DocumentSnapshot document = await FirebaseFirestore.instance.collection('approvedMedical').doc(dboyId).get();
          if(document.exists){
            if(document["status"] == "approved"){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalHome(),));

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: CustomText(text: "Login success", size: 18)));
          }else {
        // Request not accepted
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: CustomText(text: "Your request is not accepted yet", size: 18.spMin)));
      }
             
    }else {
      // Delivery boy not found
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: CustomText(text: "medical shop not found", size: 18.spMin)));
    }
          
         

      } catch (e) {
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: CustomText(text: "Error : ${e.toString()}", size: 18))
        );

      }
    }
}