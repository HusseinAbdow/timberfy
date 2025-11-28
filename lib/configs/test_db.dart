// import 'dart:io';
// import 'package:flutter/material.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   try {
//     print("Trying to connect...");
//     final socket = await Socket.connect("10.0.2.2", 5432,
//         timeout: Duration(seconds: 3));
//     print("SUCCESS! Emulator can reach your PC on port 5432!");
//     socket.destroy();
//   } catch (e) {
//     print("FAILED: Emulator cannot reach your PC -> $e");
//   }

//   runApp(const Placeholder());
// }
