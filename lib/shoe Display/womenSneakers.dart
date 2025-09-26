import 'package:flutter/material.dart';
import 'package:timberfy/models/cart.dart';
import 'package:timberfy/models/shoe.dart';

class womenSneakers extends StatefulWidget {
  const womenSneakers({super.key});

  @override
  State<womenSneakers> createState() => _womenSneakersState();
}

class _womenSneakersState extends State<womenSneakers> {
  @override
  final Cart cart = Cart();
  Widget build(BuildContext context) {
    final sneakers = cart
        .getShoeList()
        .where((s) => s.gender == "women" && s.type == "sneakers")
        .toList();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
              ],
            );
          },
        ),
      ),
    );
  }
}
