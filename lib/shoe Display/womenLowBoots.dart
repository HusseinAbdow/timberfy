import 'package:flutter/material.dart';
import 'package:timberfy/configs/database.dart';
import 'package:timberfy/pages/shoeDetails.dart';


class womenLowBoots extends StatefulWidget {
  const womenLowBoots({super.key});

  @override
  State<womenLowBoots> createState() => _womenLowBootsState();
}

class _womenLowBootsState extends State<womenLowBoots> {
final db = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
    future: (()async {
        await db.connect();
        return db.getShoes(gender: "female", type: "low");
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
        return  ListView.builder(
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
                    height: 140,
                    width: 140,
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
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        shoe.briefDescription,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500],
                        ),
                      ),
                      SizedBox(height: 5),
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



