import 'package:drugcart/admin/deliveryrequestprofile.dart';
import 'package:drugcart/model/constants.dart';
import 'package:drugcart/model/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliverRequest extends StatefulWidget {
  const DeliverRequest({super.key});

  @override
  State<DeliverRequest> createState() => _DeliverRequestState();
}

class _DeliverRequestState extends State<DeliverRequest> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryRequestProfile(),));
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          );
        },
        
        ),
    );
  }
}