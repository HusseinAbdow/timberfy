import 'package:flutter/material.dart';
import 'package:timberfy/component/RowItem.dart';

// Profile page where user account information is displayed
class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        // General page padding
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---- PROFILE IMAGE ----
            Center(
              child: const CircleAvatar(
                radius: 75, // half of 150 for clean circle
                backgroundImage: AssetImage(
                  "assets/images/onBoardingImages/profilepic.jpeg",
                ),
              ),
            ),

            SizedBox(height: 10),

            // ---- USER NAME ----
            Center(
              child: const Text(
                "Hussein Abdow",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 50),

            // ---- ACCOUNT SECTION TITLE ----
            const Text(
              "Account",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            // ---- ACCOUNT OPTIONS CONTAINER ----
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  // Account info option
                  RowItem(
                    icon: Icons.person_outline,
                    text: "Account Information",
                  ),

                  SectionDivider(),

                  // Orders option
                  RowItem(icon: Icons.shopping_bag_outlined, text: "My Orders"),

                  SectionDivider(),

                  // Address management option
                  RowItem(
                    icon: Icons.location_on_outlined,
                    text: "Address Management",
                  ),

                  SectionDivider(),

                  // App settings option
                  RowItem(icon: Icons.settings_outlined, text: "Setting"),

                  SectionDivider(),

                  // Password management option
                  RowItem(icon: Icons.lock_outline, text: "Password Manager"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
