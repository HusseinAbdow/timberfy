import 'package:flutter/material.dart';
import 'package:timberfy/component/bottomNavBar.dart';
import 'package:timberfy/pages/cartPage.dart';
import 'package:timberfy/pages/profilePage.dart';
import 'package:timberfy/pages/shopPage.dart';

// Main home page that holds bottom navigation and drawer
class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  // Keeps track of which bottom nav tab is selected
  var _selectedPageIndex = 0;

  // Pages shown based on selected bottom nav index
  final List<Widget> _pages = [
    // Home / shop screen
    shopPage(),

    // Cart screen
    cartPage(),

    // User profile screen
    profilePage(),
  ];

  // Called when user taps on bottom navigation bar
  void NavigateBottomNavbar(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ---- APP BAR ----
      appBar: AppBar(
        // Remove shadow for cleaner look
        elevation: 0,

        // Drawer menu icon
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, size: 27, color: Colors.black),
            onPressed: () {
              // Open drawer when menu icon is tapped
              Scaffold.of(context).openDrawer();
            },
          ),
        ),

        // Search icon on the right side
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(Icons.search, size: 30, color: Colors.black),
          ),
        ],
      ),

      // Displays the selected page from bottom navigation
      body: _pages[_selectedPageIndex],

      // ---- DRAWER ----
      drawer: Drawer(
        child: ListView(
          children: [
            // App / brand logo
            Image.asset(
              "assets/images/onBoardingImages/timberlandlogo.png",
              fit: BoxFit.contain,
              width: double.infinity,
            ),

            // Home option
            ListTile(
              leading: Icon(Icons.home, size: 35, color: Colors.black),
              title: Text('Home', style: TextStyle(color: Colors.black)),
            ),

            // Info option
            ListTile(
              leading: Icon(Icons.info, size: 35, color: Colors.black),
              title: Text('Home', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),

      // ---- BOTTOM NAVIGATION BAR ----
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => NavigateBottomNavbar(index),
      ),
    );
  }
}
