import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/user/model/widget/custom_textfield.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileEdit extends StatefulWidget {
  const UserProfileEdit({super.key});

  @override
  State<UserProfileEdit> createState() => _UserProfileEditState();
}

class _UserProfileEditState extends State<UserProfileEdit> {
  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _phonecontroller = TextEditingController();
  final _agecontroller = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _picker = ImagePicker();
  String? _profileImageUrl;
  
  @override
  void initState(){
    super.initState();
    _UserProfileEdView();
  }

  Future<void> _UserProfileEdView()async{
    User? user = _auth.currentUser;
    if(user != null){
      DocumentSnapshot userData = await _firestore.collection("Users").doc(user.uid).get();
      setState(() {
        _namecontroller.text = userData['name'] ?? 'No name found';
        _emailcontroller.text = userData['email'];
        _addresscontroller.text = userData['address'];
        _phonecontroller.text = userData['phone'];
        _agecontroller.text = userData['age'];
      });
    }
  }

  Future<void> _pickAndUploadImage()async {
    final PickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if(PickedFile != null){
      User? user = _auth.currentUser;
      if(user != null){
        try {
          // upload img to firebase
          final ref = _storage.ref().child('profileImage/${user.uid}.png');
          await ref.putFile(File(PickedFile.path));

          // get the ddounload url
          String downloadUrl = await ref.getDownloadURL();

          // upadate new profile image
          await _firestore.collection("Users").doc(user.uid).update({
            'profileImage': downloadUrl
          });
          setState(() {
            _profileImageUrl = downloadUrl;
          });
           ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Profile image updated successfully')),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to upload image: $e')),
          );
        }
      }
    }
  }
  
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Profile', size: 20,weight: FontWeight.bold,),centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                  .center,
                  children: [
                    GestureDetector(
                      onTap: _pickAndUploadImage,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: _profileImageUrl != null 
                        ? NetworkImage(_profileImageUrl!): null, 
                      child: _profileImageUrl == null 
                      ? Icon(Icons.person,size: 50,):null,
                      ),
                    ),
                  ],
                ),
              ),
              CustomText(text: 'Name', size: 16,color: Colors.grey,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Custom_TextField(
                      controller: _namecontroller,
                      hintText: '',
                    ),
                  ),
              CustomText(text: 'Email', size: 16,color: Colors.grey,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Custom_TextField(
                  controller: _emailcontroller,
                  hintText: 'arshad@gmail.com',
                ),
              ),
              CustomText(text: 'Phone Number', size: 16,color: Colors.grey,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Custom_TextField(
                  controller: _phonecontroller,
                  hintText: '8975849384',
                ),
              ),
              CustomText(text: 'Address', size: 16,color: Colors.grey,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Custom_TextField(
                  controller: _addresscontroller,
                  maxLines: 5,
                  hintText: 'jnfkvmdoeflmcdoelmskm',
                ),
              ),
              CustomText(text: 'Age', size: 16,color: Colors.grey,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Custom_TextField(
                  controller: _agecontroller,
                  hintText: '22',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.87,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(),));
                      }, child: CustomText(text: 'Submit', size: 24, weight: FontWeight.bold, color: Colors.white)),
                    ),
              ),
              
              
          
            ],
          ),
        ),
      ),
    );
  }
}