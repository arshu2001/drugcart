import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/admin/home.dart';
import 'package:drugcart/user/model/user_register_model.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:drugcart/user/view/userlogin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User_RegisterController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser(user_register_Model userrg, BuildContext context) async{
    try {
      // firebase authentication
      UserCredential userCredential = await  _auth.createUserWithEmailAndPassword(
        email: userrg.emaill!, password: userrg.password!);

        await _firestore.collection("Users").doc(userCredential.user!.uid).set({
          "name" : userrg.name,
          "password" : userrg.password,
          "email" : userrg.emaill,
          "address" : userrg.address,
          "age" : userrg.age,
          "phone" : userrg.phone,
          "uid" : userCredential.user!.uid
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) => UserLogin(),));
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