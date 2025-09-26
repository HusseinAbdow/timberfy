import 'package:flutter/material.dart';
import 'package:timberfy/models/cart.dart';

class menSneakers extends StatefulWidget {
  const menSneakers({super.key});

  @override
  State<menSneakers> createState() => _menSneakersState();
}

class _menSneakersState extends State<menSneakers> {
  final Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    final sneakers = cart
        .getShoeList()
        .where((s) => s.type == "sneakers" && s.gender == "male")
        .toList();

    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 8, bottom: 5),
      child: Container(
        child: ListView.builder(
          itemCount: sneakers.length,
          itemBuilder: (context, index) {
            final shoe = sneakers[index];
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 150, // fixed width
                  height: 150, // fixed height
                  child: Image.asset(shoe.imagePath.first, fit: BoxFit.contain),
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
                      SizedBox(height: 3),
                      Text(
                        shoe.briefDescription,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ), // Space between description and price
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
            );
          },
        ),
      ),
    );
  }
}
