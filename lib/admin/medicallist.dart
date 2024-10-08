import 'package:drugcart/admin/adminMedicallist.dart';
import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MedicalList extends StatefulWidget {
  const MedicalList({super.key});

  @override
  State<MedicalList> createState() => _MedicalListState();
}

class _MedicalListState extends State<MedicalList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
            child: ListTile(
              tileColor: kprimaryColor,
              trailing: Icon(Icons.person),
              title: CustomText(text: 'Name', size: 24, weight: FontWeight.w600, color: Colors.black),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdminMedicalList(),));
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          );
        },
        
        ),
    );
  }
}