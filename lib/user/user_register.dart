import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 199, 128, 128),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                child: Image.asset('images/appicon-removebg-preview.png',height: 140,))
            ],
          ),
        ),
      ),
    );
  }
}