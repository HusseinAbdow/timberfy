import 'package:flutter/material.dart';
import 'package:timberfy/configs/database.dart';
import 'package:timberfy/pages/shoeDetails.dart';

class menSneakers extends StatefulWidget {
  const menSneakers({super.key});

  @override
  State<menSneakers> createState() => _menSneakersState();
}

class _menSneakersState extends State<menSneakers> {
  @override
  Widget build(BuildContext context) {
    final db = DatabaseHelper.instance;

    return FutureBuilder(
      future: (() async {
        await db.connect();
        return db.getShoes(gender: "male", type: "sneakers");
      })(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No shoes found.'));
        }

        // Data has been fetched
        final sneakers = snapshot.data!;
        return ListView.builder(
          itemCount: sneakers.length,
          itemBuilder: (context, index) {
            final shoe = sneakers[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => shoeDetails(shoe: shoe)),
                );
              },
              child: Row(
                children: [
                  Hero(
                    tag: "shoe-${shoe.id}",
                    child: SizedBox(
                      width: 140,
                      height: 140,
                      child: Image.asset(
                        shoe.imagePath.first,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shoe.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(height: 5),
                        Text(
                          shoe.briefDescription,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 10),

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
