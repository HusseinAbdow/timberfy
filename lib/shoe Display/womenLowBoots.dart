import 'package:flutter/material.dart';
import 'package:timberfy/configs/database.dart';
import 'package:timberfy/pages/shoeDetails.dart';

// Displays women's low boots list
// StatefulWidget is used because data is loaded asynchronously
class womenLowBoots extends StatefulWidget {
  const womenLowBoots({super.key});

  @override
  State<womenLowBoots> createState() => _womenLowBootsState();
}

class _womenLowBootsState extends State<womenLowBoots> {
  // Database helper instance (singleton pattern)
  final db = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    // FutureBuilder handles async database fetching
    return FutureBuilder(
      future: (() async {
        // Ensure database connection before querying
        await db.connect();

        // Fetch only women's low boots from database
        return db.getShoes(gender: "female", type: "low");
      })(),
      builder: (context, snapshot) {
        // Show loading spinner while waiting for data
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        // Show error message if something fails
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        // Handle empty result case
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No shoes found.'));
        }

        // Shoes data is successfully fetched
        final lowBoots = snapshot.data!;

        return ListView.builder(
          itemCount: lowBoots.length,
          itemBuilder: (context, index) {
            final shoe = lowBoots[index];

            return GestureDetector(
              // Navigate to shoe details page when tapped
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
                      height: 140,
                      width: 140,
                      child: Image.asset(
                        // Display first image of the shoe
                        shoe.imagePath.first,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  SizedBox(width: 10),

                  // Text section expands to fill remaining space
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Shoe name
                        Text(
                          shoe.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 5),

                        // Short description below the name
                        Text(
                          shoe.briefDescription,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                          ),
                        ),

                        SizedBox(height: 5),

                        // Shoe price
                        Text(
                          "\$${shoe.price}",
                          style: TextStyle(
                            fontSize: 18,
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
