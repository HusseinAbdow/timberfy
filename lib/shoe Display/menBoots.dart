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
        .where((s) => s.gender == "men" && s.type == "boots")
        .toList();
    return Container(
      child: ListView.builder(
        itemCount: boots.length,
        itemBuilder: (context, index) {
          final shoe = boots[index];
          return Row(
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Image.asset(shoe.imagePath.first, fit: BoxFit.contain),
              ),
            ],
          );
        },
      ),
    );
  }
}
