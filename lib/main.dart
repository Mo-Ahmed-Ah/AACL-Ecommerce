// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Screens/login_screen.dart';
import 'package:flutter_ecommerce/Screens/splash_screen.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
      home: LoginScreen(),
    );
  }
}
