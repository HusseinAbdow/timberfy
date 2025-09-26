import 'package:flutter/material.dart';
import 'package:timberfy/component/tabBar.dart';

import 'package:timberfy/shoe%20Display/menBoots.dart';
import 'package:timberfy/shoe%20Display/menLowBoots.dart';
import 'package:timberfy/shoe%20Display/menSneakers.dart';

class menShoeTile extends StatefulWidget {
  const menShoeTile({super.key});

  @override
  State<menShoeTile> createState() => _menShoeTileState();
}

class _menShoeTileState extends State<menShoeTile> {
  int _selectedTab = 0;

  final _showWidgets = [menSneakers(), menBoots(), menLowBoots()];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //tabbar
        tabBar(
          onTap: (index) {
            setState(() {
              _selectedTab = index;
            });
          },
        ),

        //display widgets according to selected tabbar
        Expanded(child: _showWidgets[_selectedTab]),

        //diplay shoe from
      ],
    );
  }
}
