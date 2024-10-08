import 'package:drugcart/user/model/widget/constants.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminMedicalList extends StatefulWidget {
  const AdminMedicalList({super.key});

  @override
  State<AdminMedicalList> createState() => _AdminMedicalListState();
}

class _AdminMedicalListState extends State<AdminMedicalList> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              
            ],
          ),
        ),
    );
  }
}