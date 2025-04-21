import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/Screens/cart_screen.dart';
import 'package:flutter_ecommerce/Screens/favorits_screen.dart';
import 'package:flutter_ecommerce/Screens/home_screen.dart';
import 'package:flutter_ecommerce/Screens/profile_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<IconData> icons = [
    Icons.home,
    Icons.shopping_cart,
    Icons.favorite,
    Icons.person,
  ];
  int pageIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    FavoritsScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedSemantics(index: pageIndex, child: pages[pageIndex]),
      floatingActionButton: SafeArea(
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Color(0xFFDB3022),
          onPressed: () {},
          child: Icon(Icons.qr_code, size: 30, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: icons,
        activeIndex: pageIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        activeColor: const Color(0xFFDB3022),
        inactiveColor: Colors.black,
        splashColor: const Color(0xFFDB3022).withOpacity(0.2),
        onTap: (index) => setState(() => pageIndex = index),
      ),
    );
  }
}
