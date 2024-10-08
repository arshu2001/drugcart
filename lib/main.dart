import 'package:drugcart/admin/login.dart';
import 'package:drugcart/firebase_options.dart';
import 'package:drugcart/mainpage.dart';
import 'package:drugcart/medical_shop/view/home.dart';
import 'package:drugcart/medical_shop/view/login.dart';
import 'package:drugcart/medical_shop/view/product_details.dart';
import 'package:drugcart/medical_shop/view/splash.dart';
import 'package:drugcart/provider/cart_provider.dart';
import 'package:drugcart/provider/favorate_provider.dart';
import 'package:drugcart/provider/password_provider.dart';
import 'package:drugcart/user/view/bottomnav.dart';
import 'package:drugcart/user/splash.dart';
import 'package:drugcart/user/splash1.dart';
import 'package:drugcart/user/splash2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: Size(375, 812),
      builder: (context,child) {
        
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => PasswordProvider(),),
            ChangeNotifierProvider(create: (context) => CartProvider()),
            ChangeNotifierProvider(create: (context) => FavoriteProvider ())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              textTheme: TextTheme(
                
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const Mainpage(),
          ),
        );
      }
    );
  }
}
