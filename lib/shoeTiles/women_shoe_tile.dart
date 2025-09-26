import 'package:flutter/material.dart';
import 'package:timberfy/component/tabBar.dart';
import 'package:timberfy/shoe%20Display/womenBoots.dart';
import 'package:timberfy/shoe%20Display/womenLowBoots.dart';
import 'package:timberfy/shoe%20Display/womenSneakers.dart';

class womenShoeTile extends StatefulWidget {
  const womenShoeTile({super.key});

  @override
  State<womenShoeTile> createState() => _womenShoeTileState();
}

class _womenShoeTileState extends State<womenShoeTile> {
  //control the  tab
  int _selectedTab = 0;

  //list to natigate the tabs
  final _showWidgets = [womenSneakers(), womenBoots(), womenLowBoots()];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //display the tab
        tabBar(
          onTap: (index) {
            //change tab on tap
            setState(() {
              _selectedTab = index;
            });
          },
        ),

        //display shoes from selected Tab
        _showWidgets[_selectedTab],
      ],
    );
  }
}
