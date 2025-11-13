import 'package:flutter/material.dart';
import 'package:timberfy/models/cart.dart';

class menBoots extends StatefulWidget {
  const menBoots({super.key});

  @override
  State<menBoots> createState() => _menBootsState();
}

class _menBootsState extends State<menBoots> {
  final Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    final boots = cart
        .getShoeList()
        .where((s) => s.type == "boots" && s.gender == "male")
        .toList();

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ListView.builder(
        itemCount: boots.length,
        itemBuilder: (context, index) {
          final shoe = boots[index];
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
                        fontSize: 20,
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
