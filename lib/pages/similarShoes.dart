import 'package:flutter/material.dart';
import 'package:timberfy/models/cart.dart';

class similarShoes extends StatelessWidget {
  const similarShoes({super.key});

  @override
  Widget build(BuildContext context) {
    Cart cart = Cart();
    final similar = cart
        .getShoeList()
        .where((s) => s.gender == "male" && s.type == "sneakers")
        .toList();

    return SizedBox(
      height: 80, // small row of pics
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: similar.length,
        separatorBuilder: (context, _) => SizedBox(width: 12),
        itemBuilder: (context, index) {
          final shoe = similar[index];

          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Color.fromARGB(255, 222, 222, 225),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),

              child: Image.asset(
                shoe.imagePath.first,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
