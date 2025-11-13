import 'package:flutter/material.dart';
import 'package:timberfy/models/cart.dart';

class womenSneakers extends StatefulWidget {
  const womenSneakers({super.key});

  @override
  State<womenSneakers> createState() => _womenSneakersState();
}

class _womenSneakersState extends State<womenSneakers> {
  final Cart cart = Cart();
  @override
  Widget build(BuildContext context) {
    final sneakers = cart
        .getShoeList()
        .where((s) => s.gender == "female" && s.type == "sneakers")
        .toList();
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Container(
        child: ListView.builder(
          itemCount: sneakers.length,
          itemBuilder: (context, index) {
            final shoe = sneakers[index];
            return Row(
              children: [
                SizedBox(
                  width: 140,
                  height: 140,
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
            );
          },
        ),
      ),
    );
  }
}
