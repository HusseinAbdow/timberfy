import 'package:flutter/material.dart';
import 'package:timberfy/configs/database.dart';
import 'package:timberfy/pages/shoeDetails.dart';

class womenBoots extends StatefulWidget {
  const womenBoots({super.key});

  @override
  State<womenBoots> createState() => _womenBootsState();
}

class _womenBootsState extends State<womenBoots> {
final db = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
   

    return FutureBuilder(
        future: (()async {
        await db.connect();
        return db.getShoes(gender: "female", type: "boots");
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
        
        final boots = snapshot.data!;
        return  ListView.builder(
        itemCount: boots.length,
        itemBuilder: (context, index) {
          final shoe = boots[index];
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
                SizedBox(width: 5),
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
