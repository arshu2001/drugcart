import 'package:drugcart/delivery_boy.dart/view/delivery_login.dart';
import 'package:drugcart/user/model/widget/customtext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliverySplash extends StatefulWidget {
  const DeliverySplash({super.key});

  @override
  State<DeliverySplash> createState() => _DeliverySplashState();
}

class _DeliverySplashState extends State<DeliverySplash> {
  @override
   void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DeliveryLogin()),
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
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