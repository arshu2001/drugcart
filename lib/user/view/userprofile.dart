import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/user/view/usprofiledit.dart';
import 'package:drugcart/user/model/widget/custom_textfield.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _phonecontroller = TextEditingController();
  final _agecontroller = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _profileImageUrl;

  @override
  void initState(){
    super.initState();
    _UserProfile();
  }

  Future<void> _UserProfile() async{
    User? user = _auth.currentUser;
    if (user != null){
      DocumentSnapshot userData = await _firestore.collection("Users").doc(user.uid).get();
      setState(() {
        _namecontroller.text = userData['name'];
        _emailcontroller.text = userData['email'];
        _addresscontroller.text = userData['address'];
        _phonecontroller.text = userData['phone'];
        _agecontroller.text = userData['age'];
        _profileImageUrl = userData['profileImage'];
      });
    }
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Profile', size: 20,weight: FontWeight.bold,),centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfileEdit(),));
          }, icon: Icon(Icons.edit))
        ],

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
                   _profileImageUrl != null? CircleAvatar(
                      radius: 50,
                    backgroundImage: AssetImage(_profileImageUrl!), 
                    // child: Icon(Icons.person,size: 50,),
                    ): CircleAvatar(
                      radius: 50,
                      child: Icon(Icons.person,size: 50,),
                    )
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
              
              
              
          
            ],
          ),
        ),
      ),
    );
  }
}