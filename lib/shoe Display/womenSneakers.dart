import 'package:flutter/material.dart';
import 'package:timberfy/configs/database.dart';
import 'package:timberfy/pages/shoeDetails.dart';

// Displays women's sneakers list
// Uses StatefulWidget because data is fetched asynchronously
class womenSneakers extends StatefulWidget {
  const womenSneakers({super.key});

  @override
  State<womenSneakers> createState() => _womenSneakersState();
}

class _womenSneakersState extends State<womenSneakers> {
  // Database helper instance
  final db = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    // FutureBuilder handles async database operations
    return FutureBuilder(
      future: (() async {
        // Make sure database is connected
        await db.connect();

        // Fetch only women's sneakers from database
        return db.getShoes(gender: "female", type: "sneakers");
      })(),
      builder: (context, snapshot) {
        // Show loading indicator while data is loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        // Show error message if something goes wrong
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        // Handle case where no shoes are found
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No shoes found.'));
        }

        // Shoes data successfully fetched
        final sneakers = snapshot.data!;

        return ListView.builder(
          itemCount: sneakers.length,
          itemBuilder: (context, index) {
            final shoe = sneakers[index];

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
                  // Hero animation for smooth page transition
                  Hero(
                    tag: "shoe-${shoe.id}",
                    child: SizedBox(
                      width: 140,
                      height: 140,
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
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(height: 5),

                        // Short description under the name
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
