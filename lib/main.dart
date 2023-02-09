


import 'package:encomme_shop/screen/splash_logo/splash_logo_Screen.dart';
import 'package:encomme_shop/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'متجر الكتروني',
      theme: theme(),
      home: SplashLogoApp(),
    );
  }
}


