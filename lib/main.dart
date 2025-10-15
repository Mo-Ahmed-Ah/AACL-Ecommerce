// ignore_for_file: unnecessary_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce/Screens/login_screen.dart';
import 'package:flutter_ecommerce/Screens/signup_screen.dart';
import 'package:flutter_ecommerce/Screens/navigation_screen.dart';
import 'package:flutter_ecommerce/Screens/forgo_screen.dart';
import 'package:flutter_ecommerce/Screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AACL ECommerce Shopping App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFDB3022),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/sign': (context) => const SignupScreen(),
        '/nav': (context) => const NavigationScreen(),
        '/forgetPassword': (context) => ForgotScreen(),
      },
    );
  }
}
