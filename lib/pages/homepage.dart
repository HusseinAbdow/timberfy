import 'package:flutter/material.dart';
import 'package:timberfy/component/bottomNavBar.dart';
import 'package:timberfy/pages/cartPage.dart';
import 'package:timberfy/pages/profilePage.dart';
import 'package:timberfy/pages/shopPage.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  var _selectedPageIndex = 0;

  final List<Widget> _pages = [
    //home page
    shopPage(),

    //cart page
    cartPage(),

    //profile page
    profilePage(),
  ];

  //on tapping bottom navbar
  void NavigateBottomNavbar(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
        //icon for drawer
        elevation: 0,

        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, size: 27, color: Colors.black),
            onPressed: () {
              //opens drawer
              Scaffold.of(context).openDrawer();
            },
          ),
        ),

        //search bar inside appbar
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Icon(Icons.search, size: 30, color: Colors.black),
          ),
        ],
      ),

      body: _pages[_selectedPageIndex],

      drawer: Drawer(
        child: ListView(
          children: [
            Image.asset(
              "assets/images/onBoardingImages/timberlandlogo.png",
              fit: BoxFit.contain,
              width: double.infinity,
            ),
            ListTile(
              leading: Icon(Icons.home, size: 35, color: Colors.black),
              title: Text('Home', style: TextStyle(color: Colors.black)),
            ),
            ListTile(
              leading: Icon(Icons.info, size: 35, color: Colors.black),
              title: Text('Home', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => NavigateBottomNavbar(index),
      ),
    );
  }
}
