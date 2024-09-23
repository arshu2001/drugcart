// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:drugcart/model/constants.dart';
import 'package:drugcart/model/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminMedicalProfile extends StatefulWidget {
  const AdminMedicalProfile({super.key});

  @override
  State<AdminMedicalProfile> createState() => _AdminMedicalProfileState();
}

class _AdminMedicalProfileState extends State<AdminMedicalProfile> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: CustomText(text: 'Profile', size: 24, weight: FontWeight.w600, color: Colors.black)),
        ),
        body: SingleChildScrollView(
          child: Column(
            
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('images/profile.jpg'),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('',
                    style: TextStyle(
                      fontSize: 20
                    ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name'),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text('username'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text('Address'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text('Phone'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text('License No'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text('Email'),
                      )
                    ],
                  ),
                  Row(
                    children: [ 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(':'),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(':'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(':'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(':'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(':'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(':'),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Vishvas'),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text('vishvas121'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text('Kozhikode'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text('7550874646'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text('VSH4563782'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text('vishvas121@gmail.com'),
                          )
                        ],
                      )
                    ],
                  )
                  
      
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 50,
                        decoration: BoxDecoration(
                          color: kprimaryColor,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Center(child: Text('Accept',style: TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                          )),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 50,
                        decoration: BoxDecoration(
                          color: kprimaryColor,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Center(child: Text('Reject',style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                          )),
                      ),
                    ),
                  ],
                ),
              )
              
            ],
          ),
        ),
      ),
    );
  }
}