import 'package:flutter/material.dart';

class FavoritsScreen extends StatelessWidget {
  const FavoritsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Favorits Screen",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFFEF6969),
          ),
        ),
      ),
    );
  }
}
