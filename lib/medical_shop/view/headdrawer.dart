import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeadDrawer extends StatefulWidget {
  const HeadDrawer({super.key});

  @override
  State<HeadDrawer> createState() => _HeadDrawerState();
}

class _HeadDrawerState extends State<HeadDrawer> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? _name;
  String? _email;
  String? _phone;
  String? _profileImageUrl;
  bool _isLoading = false;
  
  @override
  void initState() {
    super.initState();
    _fetchMedicalProfileview();  // Call the method to fetch user data
  }
 
  Future<void> _fetchMedicalProfileview() async{
    setState(() {
      _isLoading = true;
    });

    try {
      User? user = _auth.currentUser;
      if(user != null){
        DocumentSnapshot userData = await _firestore
        .collection("Medicine")
        .doc(user.uid)
        .get();

        if(userData.exists){
          setState(() {
            _name = userData['name'];
            _email = userData['email'];
            _phone = userData['phone'];
            _profileImageUrl = userData['profileImage'];
          });
        }else{
          print('user does not exist');
        }
      }else{
        print('No user is currently signed in');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF00796B),
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: _profileImageUrl != null
                        ? DecorationImage(image: NetworkImage(_profileImageUrl!),fit: BoxFit.cover)
                        : const DecorationImage(image: AssetImage('images/ravi.png')),
                  ),
                ),
                CustomText(
                  text: _name ?? '', // Show fetched name or default
                  size: 20,
                  weight: FontWeight.normal,
                  color: Colors.black,
                ),
                CustomText(
                  text: _email ?? '', // Show fetched email or default
                  size: 16,
                  weight: FontWeight.normal,
                  color: Colors.white,
                ),
                CustomText(
                  text: _phone ?? '', // Show fetched phone or default
                  size: 16,
                  weight: FontWeight.normal,
                  color: Colors.white,
                ),
              ],
            ),
    );
  }
}