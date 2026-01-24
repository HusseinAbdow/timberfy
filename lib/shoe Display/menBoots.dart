import 'package:flutter/material.dart';
import 'package:timberfy/configs/database.dart';
import 'package:timberfy/pages/shoeDetails.dart';

// Widget responsible for displaying men's boots list
// Stateful because it relies on async data from the database
class menBoots extends StatefulWidget {
  const menBoots({super.key});

  @override
  State<menBoots> createState() => _menBootsState();
}

class _menBootsState extends State<menBoots> {
  // Database helper instance (singleton)
  final db = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    // FutureBuilder handles fetching data from database asynchronously
    return FutureBuilder(
      future: (() async {
        // Ensure database connection is established
        await db.connect();

        // Fetch shoes filtered by gender and type
        return db.getShoes(gender: "male", type: "boots");
      })(),
      builder: (context, snapshot) {
        // While waiting for data, show loading indicator
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        // If an error occurs during database query
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        // If no data is returned or list is empty
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No shoes found.'));
        }

        // Store fetched boots list
        final boots = snapshot.data!;

        return ListView.builder(
          itemCount: boots.length,
          itemBuilder: (context, index) {
            final shoe = boots[index];

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
                  // Hero animation for smooth transition to details page
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

                  // Expanded allows text section to take remaining space
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Shoe name
                        Text(
                          shoe.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),

                        // Short description under shoe name
                        Text(
                          shoe.briefDescription,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
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
