import 'package:flutter/material.dart';
import 'package:timberfy/pages/homepage.dart';
import 'package:timberfy/pages/onBoardingScreen.dart';
import 'package:timberfy/pages/signIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFFFAFAFA),
          surfaceTintColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: Color(0xFFFAFAFA),
      ),
      routes: {
        "/signin": (context) => SignIn(),

        "/homePage": (context) => homePage(),
      },

      debugShowCheckedModeBanner: false,

      home: onBoardingScreen(),
    );
  }
}
