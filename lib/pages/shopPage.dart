import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberfy/component/dropDown.dart';

// imports for different shoe category displays
import 'package:timberfy/shoe%20Display/menBoots.dart';
import 'package:timberfy/shoe%20Display/menLowBoots.dart';
import 'package:timberfy/shoe%20Display/menSneakers.dart';
import 'package:timberfy/shoe%20Display/womenBoots.dart';
import 'package:timberfy/shoe%20Display/womenLowBoots.dart';
import 'package:timberfy/shoe%20Display/womenSneakers.dart';

// imports for shoe tiles (main grid view)
import 'package:timberfy/shoeTiles/men_shoe_tile.dart';
import 'package:timberfy/shoeTiles/women_shoe_tile.dart';

class shopPage extends StatefulWidget {
  const shopPage({super.key});

  @override
  State<shopPage> createState() => _shopPageState();
}

class _shopPageState extends State<shopPage> {
  // keeps track of the currently selected gender filter
  // default value is "men"
  String _selectedValue = "men";

  // map used to organize widgets based on gender and index
  // this helps structure which shoe display widgets belong to men or women
  final Map<String, Map<int, Widget>> showWidgets = {
    "men": {0: menSneakers(), 1: menBoots(), 2: menLowBoots()},
    "women": {0: womenSneakers(), 1: womenBoots(), 2: womenLowBoots()},
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // allows vertical scrolling for smaller screens
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // main heading text
              Text(
                "Our Best\nCollections Are Here",
                style: GoogleFonts.oswald(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),

              SizedBox(height: 20),

              // row holding the slogan text and gender dropdown
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // brand slogan / subtitle
                  Text(
                    "\"Step into Your Legacy\"",
                    style: GoogleFonts.oswald(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),

                  // custom dropdown used to switch between men and women
                  dropDown(
                    onChanged: (String? newValue) {
                      // update selected value and rebuild UI
                      setState(() {
                        _selectedValue = newValue!;
                      });
                    },
                    value: _selectedValue,
                  ),
                ],
              ),

              SizedBox(height: 10),

              // container for shoe tiles (men or women)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,

                // conditional rendering based on dropdown selection
                // shows men shoes if "men" is selected, otherwise women shoes
                child: _selectedValue == "men"
                    ? menShoeTile()
                    : womenShoeTile(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
