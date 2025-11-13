import 'package:flutter/material.dart';
import 'package:timberfy/models/cart.dart';

class womenLowBoots extends StatefulWidget {
  const womenLowBoots({super.key});

  @override
  State<womenLowBoots> createState() => _womenLowBootsState();
}

class _womenLowBootsState extends State<womenLowBoots> {
  final Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    final lowBoots = cart
        .getShoeList()
        .where((s) => s.gender == "female" && s.type == "low")
        .toList();
    return Container(
      child: ListView.builder(
        itemCount: lowBoots.length,
        itemBuilder: (context, index) {
          final shoe = lowBoots[index];
          return Row(
            children: [
              SizedBox(
                height: 140,
                width: 140,
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
          );
        },
      ),
    );
  }
}
