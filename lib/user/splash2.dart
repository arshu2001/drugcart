import 'package:drugcart/model/customtext.dart';
import 'package:drugcart/user/userlogin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserSplash2 extends StatefulWidget {
  const UserSplash2({super.key});

  @override
  State<UserSplash2> createState() => _UserSplash2State();
}

class _UserSplash2State extends State<UserSplash2> {
  @override
      void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 5), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => UserLogin()),
    );
  }
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 128, 128),
      body: Stack(
        
        children: [
          
          Center(child: Padding(
            padding: const EdgeInsets.only(bottom: 450),
            child: Image.asset('images/appicon-removebg-preview.png',width:140,height:140 ,),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 516,
              width: screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.amber
              ),
              child: Image.asset('images/medicineoffer.png',fit: BoxFit.fill,),
            ),
          )
        ],
      ),
    );
  }
}