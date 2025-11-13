import 'package:flutter/material.dart';
import 'package:timberfy/models/cart.dart';

class womenBoots extends StatefulWidget {
  const womenBoots({super.key});

  @override
  State<womenBoots> createState() => _womenBootsState();
}

class _womenBootsState extends State<womenBoots> {
  final Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    final sneakers = cart
        .getShoeList()
        .where((s) => s.gender == "female" && s.type == "boots")
        .toList();

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: ListView.builder(
        itemCount: sneakers.length,
        itemBuilder: (context, index) {
          final shoe = sneakers[index];
          return Row(
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset(shoe.imagePath.first, fit: BoxFit.contain),
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
          );
        },
      ),
    );
  }
}
