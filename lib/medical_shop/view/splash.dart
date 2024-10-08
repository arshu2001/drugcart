import 'package:drugcart/medical_shop/view/login.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:drugcart/user/splash.dart';
import 'package:flutter/material.dart';

class MedicalSplash extends StatefulWidget {
  const MedicalSplash({super.key});

  @override
  State<MedicalSplash> createState() => _MedicalSplashState();
}

class _MedicalSplashState extends State<MedicalSplash> {
   void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 5), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MedicalLogin()),
    );
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('images/splashbackground.png',fit: BoxFit.cover,),
          Center(child: Padding(
            padding: const EdgeInsets.only(bottom: 450),
            child: Image.asset('images/appicon-removebg-preview.png',width:140,height:140 ,),
          )),
          Center(child: Padding(
            padding: const EdgeInsets.only(bottom: 200,left: 5),
            child: CustomText(text: 'Welcome To  Drug Cart Online Shopping Mall', size: 32, weight: FontWeight.bold, color: Colors.white),
          )),

        ],
      ),
    );
  }
}