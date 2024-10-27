import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/user/view/payment.dart';
import 'package:drugcart/user/model/widget/custom_textfield.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Add_Address extends StatefulWidget {
  const Add_Address({super.key});

  @override
  State<Add_Address> createState() => _Add_AddressState();
}

class _Add_AddressState extends State<Add_Address> {
  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _addresscontroller = TextEditingController();
  final _phonecontroller = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isEditingProfile = false;

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
        
        
      });
    }
  }
  
   Future<void> _UserProfileUpdate() async{
    User? user = _auth.currentUser;
    if(user != null){
      if(_namecontroller.text.isEmpty || _emailcontroller.text.isEmpty||
      _phonecontroller.text.isEmpty || _addresscontroller.text.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
      }
      try {
        await _firestore.collection("Users").doc(user.uid).update({
          "name" : _namecontroller.text,
          'email': _emailcontroller.text,
          'address' : _addresscontroller.text,
          'phone' : _phonecontroller.text,
          
        });
         ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated successfully')),
        );
        setState(() {
          _isEditingProfile = false;
        });
      } catch (e) {
         ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update Profile: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Add Address', size: 18,weight: FontWeight.bold,),centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'Name', size: 16,color: Colors.grey,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Custom_TextField(
                  controller: _namecontroller,
                  hintText: '',
                  readOnly: !_isEditingProfile,
                ),
              ),
              const SizedBox(height: 20,),
               CustomText(text: 'Mobile Number', size: 16,color: Colors.grey,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Custom_TextField(
                  controller: _phonecontroller,
                  hintText: '',
                  readOnly: !_isEditingProfile,
                ),
              ),
              const SizedBox(height: 20,),
               CustomText(text: 'Address', size: 16,color: Colors.grey,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Custom_TextField(
                  controller: _addresscontroller,
                  hintText: '',
                  maxLines: 5,
                  readOnly: !_isEditingProfile,
                ),
              ),
              const SizedBox(height: 20,),
               CustomText(text: 'Email', size: 16,color: Colors.grey,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Custom_TextField(
                  controller: _emailcontroller,
                  hintText: '',
                  readOnly: !_isEditingProfile,
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.87,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green
                        ),
                        onPressed: () {
                          setState(() {
                            if(_isEditingProfile){
                              _UserProfileUpdate();
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => Payment(),));
                              Navigator.pop(context);
                            } else{
                              _isEditingProfile = true;
                            }

                          });
                        // 
                      }, child: CustomText(text: _isEditingProfile ?
                       'Submit' : 'Update', size: 24, weight: FontWeight.bold, color: Colors.white)),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}