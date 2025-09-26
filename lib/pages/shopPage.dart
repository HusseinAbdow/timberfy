import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberfy/component/dropDown.dart';
import 'package:timberfy/shoe%20Display/menBoots.dart';
import 'package:timberfy/shoe%20Display/menLowBoots.dart';
import 'package:timberfy/shoe%20Display/menSneakers.dart';
import 'package:timberfy/shoe%20Display/womenBoots.dart';
import 'package:timberfy/shoe%20Display/womenLowBoots.dart';
import 'package:timberfy/shoe%20Display/womenSneakers.dart';
import 'package:timberfy/shoeTiles/men_shoe_tile.dart';
import 'package:timberfy/shoeTiles/women_shoe_tile.dart';

class shopPage extends StatefulWidget {
  const shopPage({super.key});

  @override
  State<shopPage> createState() => _shopPageState();
}

class _shopPageState extends State<shopPage> {
  String _selectedValue = "men";

  final Map<String, Map<int, Widget>> showWidgets = {
    "men": {0: menSneakers(), 1: menBoots(), 2: menLowBoots()},
    "women": {0: womenSneakers(), 1: womenBoots(), 2: womenLowBoots()},
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Our Best\nCollections Are Here",
                  style: GoogleFonts.oswald(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\"Step into Your Legacy\"",
                      style: GoogleFonts.oswald(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    dropDown(
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedValue = newValue!;
                        });
                      },
                      value: _selectedValue,
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: _selectedValue == "men" ? menShoeTile() : womenShoeTile(),
          ),
        ],
      ),
    );
  }
}
