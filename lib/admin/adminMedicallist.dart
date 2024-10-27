import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminMedicalList extends StatefulWidget {
  final String? userId;
  const AdminMedicalList({super.key, this.userId});

  @override
  State<AdminMedicalList> createState() => _AdminMedicalListState();
}

class _AdminMedicalListState extends State<AdminMedicalList> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final FirebaseAuth _auth = FirebaseAuth.instance;

    Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: CustomText(
              text: label,
              size: 16,
              color: Colors.white70,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: CustomText(
              text: value,
              size: 16,
              color: Colors.white,
              maxLine: 3,
              textOverflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: CustomText(text: 'Profile', size: 24, weight: FontWeight.w600, color: Colors.black),
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
          body: SingleChildScrollView(
            child: StreamBuilder(
              stream: _firestore.collection('Medicine').doc(widget.userId).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || !snapshot.data!.exists) {
                  return Center(child: Text('Medical shop not found'));
                }
                var userData = snapshot.data!.data() as Map<String, dynamic>;
                return Column(
                  
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                          radius: 50,
                          backgroundImage: userData['profileImage'] != null && userData['profileImage'].isNotEmpty 
                          ? NetworkImage(userData['profileImage'])
                          : null
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24,),
                    Container(
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.teal.withOpacity(0.3),
                          width: 1
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.teal.withOpacity(0.3),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.person_outline,color: Colors.white,),
                                SizedBox(width: 8,),
                                CustomText(text: 'Medical Shop Information', 
                                size: 18,
                                weight: FontWeight.w600,
                                color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                           Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                _buildInfoRow('Name', userData['name'] ?? 'N/A'),
                                _buildInfoRow('Email', userData['email'] ?? 'N/A'),
                                _buildInfoRow('Address', userData['address'] ?? 'N/A'),
                                _buildInfoRow('Phone', userData['phone'] ?? 'N/A'),
                                _buildInfoRow('License No', userData['license'] ?? 'N/A'),
                                _buildInfoRow('Shop Name', userData['shop'] ?? 'N/A'),
                                _buildInfoRow('User ID', widget.userId ?? 'N/A'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                    
                  ],
                );
              }
            ),
          ),
      ),
    );
  }
}