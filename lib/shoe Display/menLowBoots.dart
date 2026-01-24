import 'package:flutter/material.dart';
import 'package:timberfy/configs/database.dart';
import 'package:timberfy/pages/shoeDetails.dart';

// Displays men's low boots list
// Uses StatefulWidget because data is fetched asynchronously
class menLowBoots extends StatefulWidget {
  const menLowBoots({super.key});

  @override
  State<menLowBoots> createState() => _menLowBootsState();
}

class _menLowBootsState extends State<menLowBoots> {
  // Singleton database helper instance
  final db = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    // FutureBuilder handles async shoe fetching
    return FutureBuilder(
      future: (() async {
        // Make sure database connection is ready
        await db.connect();

        // Fetch only men's low boots from database
        return db.getShoes(gender: "male", type: "low");
      })(),
      builder: (context, snapshot) {
        // Show loading indicator while waiting
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        // Display error message if something goes wrong
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        // Handle empty or null data case
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No shoes found.'));
        }

        // Store fetched low boots list
        final lowBoots = snapshot.data!;

        return ListView.builder(
          itemCount: lowBoots.length,
          itemBuilder: (context, index) {
            final shoe = lowBoots[index];

            return GestureDetector(
              // Navigate to shoe details page on tap
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => shoeDetails(shoe: shoe)),
                );
              },
              child: Row(
                children: [
                  // Hero animation for smooth transition
                  Hero(
                    tag: "shoe-${shoe.id}",

                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset(
                        // Display first image of the shoe
                        shoe.imagePath.first,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),

                  // Expanded to allow text section to fill remaining space
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Shoe name
                        Text(
                          shoe.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                        // Space between name and description
                        SizedBox(height: 5),

                        // Short shoe description
                        Text(
                          shoe.briefDescription,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // Space between description and price
                        SizedBox(height: 5),

                        // Shoe price
                        Text(
                          "\$${shoe.price}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
