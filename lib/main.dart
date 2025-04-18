import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AACL ECommerce Shopping App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFFEF6969)),
      home: SplashScreen(),
    );
  }
}
