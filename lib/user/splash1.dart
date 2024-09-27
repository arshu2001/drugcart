import 'package:drugcart/widget/customtext.dart';
import 'package:drugcart/user/splash2.dart';
import 'package:flutter/material.dart';

class UserSplash1 extends StatefulWidget {
  const UserSplash1({super.key});

  @override
  State<UserSplash1> createState() => _UserSplash1State();
}

class _UserSplash1State extends State<UserSplash1> {
  @override
    void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 5), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => UserSplash2()),
    );
  }

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
            child: CustomText(text: 'Drug Cart', size: 40, weight: FontWeight.bold, color: Colors.white),
          )),
          Center(child: Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: CustomText(text: 'Prescription for a Better Life', size: 20, weight: FontWeight.normal, color: Color.fromARGB(255, 108, 106, 106)),
          ))
        ],
      ),
    );
  }
}