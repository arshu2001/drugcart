import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/delivery_boy.dart/view/bottomnav/delivery_profileedit.dart';
import 'package:drugcart/user/model/widget/custom_textfield.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliveryProfile extends StatefulWidget {
  const DeliveryProfile({super.key});

  @override
  State<DeliveryProfile> createState() => _DeliveryProfileState();
}

class _DeliveryProfileState extends State<DeliveryProfile> {
  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _phonecontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  final _gendercontroller = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _profileImageUrl;
  bool _isLoading = true;


  Future<void> _fetchDeliveryProfile() async{
    setState(() {
      _isLoading = true;
    });
    
    try {
      User? user = _auth.currentUser;
      if(user != null){
        DocumentSnapshot userData = await _firestore.collection("approvedDeliveryBoy").doc(user.uid).get();

        if(userData.exists){
          setState(() {
         _namecontroller.text = userData['name'];
        _emailcontroller.text = userData['email'];
        _addresscontroller.text = userData['address'];
        _phonecontroller.text = userData['phone'];
        _agecontroller.text = userData['age'];
        _agecontroller.text = userData['gender'];
        _profileImageUrl = userData['profileImage'];
          });
        }else{
          print("user does not exist");
        }
      }else{
        print("no user is currently signed in");
      }
    } catch (e) {
      print("error fetching user data : $e");
    }finally{
      setState(() {
        _isLoading = false;
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Profile', size: 20,weight: FontWeight.bold,),centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryProfileEdit(),)).then((_) => _fetchDeliveryProfile());
          }, icon: Icon(Icons.edit))
        ],

      ),
      body:  _isLoading 
      ?Center(child: CircularProgressIndicator(),)
       : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child:  Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: _profileImageUrl != null 
                    ? NetworkImage(_profileImageUrl!)
                    :null,
                    child: _profileImageUrl == null 
                    ? Icon(Icons.person,size: 50,):null,
                  )
              ),
              ),
              // CustomText(text: 'Name', size: 16,color: Colors.grey,),
              //     SizedBox(
              //       width: MediaQuery.of(context).size.width * 0.9,
              //       child: Custom_TextField(
              //         controller: _namecontroller,
              //         hintText: '',
              //       ),
              //     ),
              // CustomText(text: 'Email', size: 16,color: Colors.grey,),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   child: Custom_TextField(
              //     controller: _emailcontroller,
              //     hintText: 'arshad@gmail.com',
              //   ),
              // ),
              // CustomText(text: 'Phone Number', size: 16,color: Colors.grey,),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   child: Custom_TextField(
              //     controller: _phonecontroller,
              //     hintText: '8975849384',
              //   ),
              // ),
              // CustomText(text: 'Address', size: 16,color: Colors.grey,),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   child: Custom_TextField(
              //     controller: _addresscontroller,
              //     maxLines: 5,
              //     hintText: 'jnfkvmdoeflmcdoelmskm',
              //   ),
              // ),
              // CustomText(text: 'Age', size: 16,color: Colors.grey,),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.9,
              //   child: Custom_TextField(
              //     controller: _agecontroller,
              //     hintText: '22',
              //   ),
              // ),
               // Name field
                    _buildProfileFieldDelivery('Name', _namecontroller),
                    // Email field
                    _buildProfileFieldDelivery('Email', _emailcontroller),
                    // Phone Number field
                    _buildProfileFieldDelivery('Phone Number', _phonecontroller),
                    // Address field
                    _buildProfileFieldDelivery('Address', _addresscontroller, maxLines: 5),
                    // Age field
                    _buildProfileFieldDelivery('Age', _agecontroller),
                    // gender field
                    _buildProfileFieldDelivery('Genter', _gendercontroller)
              
              
          
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileFieldDelivery(String label, TextEditingController controller, {int? maxLines}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: label, size: 16, color: Colors.grey),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Custom_TextField(
            controller: controller,
            hintText: '',
            maxLines: maxLines,
            readOnly: true, // Make fields read-only in profile view
          ),
        ),
        SizedBox(height: 10), // Add some spacing between fields
      ],
    );
  }
}