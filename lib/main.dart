import 'package:flutter/material.dart';
import 'package:timberfy/pages/homepage.dart';
import 'package:timberfy/pages/onBoardingScreen.dart';
import 'package:timberfy/pages/signIn.dart';

// Application entry point
void main() {
  runApp(MyApp());
}

// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Global theme settings
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFFFAFAFA),
          surfaceTintColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: Color(0xFFFAFAFA),
      ),

      // Named route definitions
      routes: {
        "/signin": (context) => SignIn(),
        "/homePage": (context) => homePage(),
      },

      // Disable debug banner
      debugShowCheckedModeBanner: false,

      // Initial screen shown when app starts
      home: onBoardingScreen(),
    );
  }
}
