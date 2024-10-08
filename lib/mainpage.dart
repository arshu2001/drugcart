import 'package:drugcart/admin/login.dart';
import 'package:drugcart/medical_shop/view/splash.dart';
import 'package:drugcart/user/splash.dart';
import 'package:flutter/material.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminLogin(),));
            }, child: Text('Admin')),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalSplash(),));
            }, child: Text('Medical')),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserSplash(),));
            }, child: Text('User'))
          ],
        ),
      ),
    );
  }
}