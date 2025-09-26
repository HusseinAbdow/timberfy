import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  final void Function(int)? onTabChange;
  const BottomNavBar({super.key, required this.onTabChange});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    //Bottom Navigation Bar
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 10, horizontal: 15),

          child: GNav(
            //icons for bottom navbar
            tabs: [
              GButton(icon: Icons.home, text: "Home"),
              GButton(icon: Icons.shopping_bag, text: "Cart"),
              GButton(icon: Icons.account_circle, text: "profile"),
            ],

            //on tap
            onTabChange: widget.onTabChange,

            //style the navbar
            color: Colors.white,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.white,
            tabBorderRadius: 20,
          ),
        ),
      ),
    );
  }
}
