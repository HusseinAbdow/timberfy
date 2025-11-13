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

    return Container(
      margin: const EdgeInsets.only(bottom: 15),

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
    );
  }
}
