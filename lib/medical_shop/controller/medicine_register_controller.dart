import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/medical_shop/model/medical_register_model.dart';
import 'package:drugcart/medical_shop/view/login.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class medicine_Register_Controller{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> medicineregister(Medical_Register_Modal medicinereg, BuildContext context )
  async{
    try {
      UserCredential userCredential = await
      _auth.createUserWithEmailAndPassword(email: medicinereg.email!, password: medicinereg.password!);

      await _firestore.collection("Medicine").doc(userCredential.user!.uid).set({
        "name" : medicinereg.name,
        "password" : medicinereg.password,
        "email" : medicinereg.email,
        "address" : medicinereg.address,
        "license" : medicinereg.licensenumber,
        "phone" : medicinereg.phone,
        "shope" : medicinereg.shopname,
        "uid" : userCredential.user!.uid
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalLogin(),));
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: CustomText(text: "Registration success", size: 18))
        );
    } catch (e) {
       print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: CustomText(text: "Error : ${e.toString()}", size: 18))
        );
        return;

    }
  }
}