import 'package:drugcart/medical_shop/login.dart';
import 'package:drugcart/medical_shop/product_details.dart';
import 'package:drugcart/medical_shop/splash.dart';
import 'package:drugcart/user/bottomnav.dart';
import 'package:drugcart/user/splash.dart';
import 'package:drugcart/user/splash1.dart';
import 'package:drugcart/user/splash2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
          
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MedicineDetails(),
    );
  }
}
