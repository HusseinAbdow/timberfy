import 'package:flutter/material.dart';
import 'package:timberfy/configs/database.dart';
import 'package:timberfy/models/shoe.dart';
import 'package:timberfy/pages/shoeDetails.dart';

// Widget to show shoes similar to the currently selected shoe
// Stateless because it depends only on the provided shoe and database result
class similarShoes extends StatelessWidget {
  // The shoe currently being viewed (used to find similar ones)
  final Shoe shoe;

  // Database helper instance (singleton)
  final db = DatabaseHelper.instance;

  // Constructor requires a Shoe object
  similarShoes({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    // FutureBuilder is used to handle async database operations
    return FutureBuilder<List<Shoe>>(
      future: (() async {
        // Ensure database connection is open
        await db.connect();

        // Fetch shoes with the same gender and type as the current shoe
        return db.getShoes(gender: shoe.gender, type: shoe.type);
      })(),
      builder: (context, snapshot) {
        // While data is loading, show a loading indicator
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        // If an error occurs during fetching
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        // If the query returns no data or an empty list
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No similar shoes found.'));
        }

        // Store the fetched similar shoes
        final similar = snapshot.data!
            .where((similarShoe) => similarShoe.id != shoe.id)
            .toList();

        if (similar.isEmpty) {
          return Center(child: Text('No similar shoes found.'));
        }

        return SizedBox(
          // Fixed height for horizontal shoe list
          height: 80,
          child: ListView.separated(
            // Horizontal scrolling list
            scrollDirection: Axis.horizontal,
            itemCount: similar.length,

            // Space between shoe items
            separatorBuilder: (_, __) => SizedBox(width: 12),

            itemBuilder: (context, index) {
              final s = similar[index];

              return GestureDetector(
                // Navigate to shoe details when tapped
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => shoeDetails(key: ValueKey(s.id), shoe: s),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    // Rounded container background
                    borderRadius: BorderRadius.circular(13),
                    color: Color.fromARGB(255, 222, 222, 225),
                  ),
                  child: ClipRRect(
                    // Ensures image respects rounded corners
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      // Display first image of the shoe
                      s.imagePath.first,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
