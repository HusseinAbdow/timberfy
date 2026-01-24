import 'package:flutter/material.dart';
import 'package:timberfy/configs/database.dart';
import 'package:timberfy/pages/shoeDetails.dart';

// Displays women's boots list
// Uses StatefulWidget because shoes are loaded asynchronously
class womenBoots extends StatefulWidget {
  const womenBoots({super.key});

  @override
  State<womenBoots> createState() => _womenBootsState();
}

class _womenBootsState extends State<womenBoots> {
  // Database helper instance (singleton)
  final db = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    // FutureBuilder manages loading, error, and data states
    return FutureBuilder(
      future: (() async {
        // Ensure database connection is ready
        await db.connect();

        // Fetch only women's boots from database
        return db.getShoes(gender: "female", type: "boots");
      })(),
      builder: (context, snapshot) {
        // Show loading indicator while data is being fetched
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        // Show error message if something goes wrong
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        // Handle empty data case
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No shoes found.'));
        }

        // Shoes data is available
        final boots = snapshot.data!;

        return ListView.builder(
          itemCount: boots.length,
          itemBuilder: (context, index) {
            final shoe = boots[index];

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
                  // Hero animation for smooth transition to details page
                  Hero(
                    tag: "shoe-${shoe.id}",
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset(
                        // Display the main shoe image
                        shoe.imagePath.first,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  SizedBox(width: 5),

                  // Expanded allows text content to fill remaining space
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

                        SizedBox(height: 5),

                        // Short description of the shoe
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
