import 'package:flutter/material.dart';
import 'package:timberfy/configs/database.dart';
import 'package:timberfy/pages/shoeDetails.dart';

class menLowBoots extends StatefulWidget {
  const menLowBoots({super.key});

  @override
  State<menLowBoots> createState() => _menLowBootsState();
}

class _menLowBootsState extends State<menLowBoots> {
final db = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
  future: (()async {
        await db.connect();
        return db.getShoes(gender: "male", type: "low");
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
  final lowBoots = snapshot.data!;
  return ListView.builder(
        itemCount: lowBoots.length,
        itemBuilder: (context, index) {
          final shoe = lowBoots[index];
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
                    width: 150,
                    height: 150,
                    child: Image.asset(shoe.imagePath.first, fit: BoxFit.contain),
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

                      // Space between name and description
                      SizedBox(height: 5),
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
