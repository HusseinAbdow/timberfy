import 'package:flutter/material.dart';
import 'package:timberfy/models/cart.dart';

class menLowBoots extends StatefulWidget {
  const menLowBoots({super.key});

  @override
  State<menLowBoots> createState() => _menLowBootsState();
}

class _menLowBootsState extends State<menLowBoots> {
  final Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    final lowBoots = cart
        .getShoeList()
        .where((s) => s.type == "low" && s.gender == "male")
        .toList();
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ListView.builder(
        itemCount: lowBoots.length,
        itemBuilder: (context, index) {
          final shoe = lowBoots[index];
          return Row(
            children: [
              SizedBox(
                width: 150,
                height: 150,
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
          );
        },
      ),
    );
  }
}
