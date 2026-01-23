import 'package:flutter/material.dart';
import 'package:timberfy/component/RowItem.dart';

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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const CircleAvatar(
                radius: 75, // half of 150
                backgroundImage: AssetImage(
                  "assets/images/onBoardingImages/profilepic.jpeg",
                ),
              ),
            ),
            SizedBox(height: 10),

            Center(
              child: const Text(
                "Hussein Abdow",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 50),
            const Text(
              "Account",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  RowItem(
                    icon: Icons.person_outline,

                    text: "Account Information",
                  ),
                  SectionDivider(),
                  RowItem(icon: Icons.shopping_bag_outlined, text: "My Orders"),
                  SectionDivider(),
                  RowItem(
                    icon: Icons.location_on_outlined,
                    text: "Address Management",
                  ),
                  SectionDivider(),
                  RowItem(icon: Icons.settings_outlined, text: "Setting"),
                  SectionDivider(),
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
