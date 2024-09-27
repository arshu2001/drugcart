import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:drugcart/widget/customtext.dart';
import 'package:drugcart/user/splash1.dart';
import 'package:flutter/material.dart';

class UserSplash extends StatefulWidget {
  const UserSplash({super.key});

  @override
  State<UserSplash> createState() => _UserSplashState();
}

class _UserSplashState extends State<UserSplash> {
  @override
    void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => UserSplash1()),
    );
  }

  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: AnimatedSplashScreen(
    //     splash: 'assets/appicon.png',
    //     splashIconSize: 200.0, // Adjusted size from 2000.0 to 200.0 for better scaling
    //     centered: true,
    //     nextScreen: const UserSplash1(),
    //     backgroundColor: Colors.black,
    //     duration: 3100,
    //   ),
    // );
    // ignore: dead_code
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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