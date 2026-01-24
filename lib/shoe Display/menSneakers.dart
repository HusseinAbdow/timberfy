import 'package:flutter/material.dart';
import 'package:timberfy/configs/database.dart';
import 'package:timberfy/pages/shoeDetails.dart';

// Displays men's sneakers list
// StatefulWidget is needed because data comes from async database call
class menSneakers extends StatefulWidget {
  const menSneakers({super.key});

  @override
  State<menSneakers> createState() => _menSneakersState();
}

class _menSneakersState extends State<menSneakers> {
  @override
  Widget build(BuildContext context) {
    // Get database helper instance
    final db = DatabaseHelper.instance;

    // FutureBuilder handles async loading from database
    return FutureBuilder(
      future: (() async {
        // Ensure database connection is active
        await db.connect();

        // Fetch only men's sneakers
        return db.getShoes(gender: "male", type: "sneakers");
      })(),
      builder: (context, snapshot) {
        // Show loading spinner while waiting for data
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        // Handle database or query errors
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        // Handle empty data case
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No shoes found.'));
        }

        // Data has been fetched successfully
        final sneakers = snapshot.data!;

        return ListView.builder(
          itemCount: sneakers.length,
          itemBuilder: (context, index) {
            final shoe = sneakers[index];

            return GestureDetector(
              // Navigate to shoe details page when item is tapped
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => shoeDetails(shoe: shoe)),
                );
              },
              child: Row(
                children: [
                  // Hero animation for smooth image transition
                  Hero(
                    tag: "shoe-${shoe.id}",
                    child: SizedBox(
                      width: 140,
                      height: 140,
                      child: Image.asset(
                        // Display the first shoe image
                        shoe.imagePath.first,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  SizedBox(width: 10),

                  // Expanded so text takes remaining horizontal space
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
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 10),

                        // Shoe price
                        Text(
                          "\$${shoe.price}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
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
