import 'package:flutter/material.dart';
import 'package:timberfy/component/tabBar.dart';

// importing the different shoe category screens
import 'package:timberfy/shoe%20Display/menBoots.dart';
import 'package:timberfy/shoe%20Display/menLowBoots.dart';
import 'package:timberfy/shoe%20Display/menSneakers.dart';

class menShoeTile extends StatefulWidget {
  const menShoeTile({super.key});

  @override
  State<menShoeTile> createState() => _menShoeTileState();
}

class _menShoeTileState extends State<menShoeTile> {
  // keeps track of which tab is currently selected
  // 0 -> sneakers, 1 -> boots, 2 -> low boots
  int _selectedTab = 0;

  // list of widgets to show based on the selected tab
  // index of this list matches the tab index
  final _showWidgets = [menSneakers(), menBoots(), menLowBoots()];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // custom tab bar widget at the top
        // when a tab is tapped, we update the selected index
        tabBar(
          onTap: (index) {
            setState(() {
              _selectedTab = index;
            });
          },
        ),

        // shows the widget that matches the selected tab
        // Expanded is used so the content takes remaining space
        Expanded(child: _showWidgets[_selectedTab]),

        // diplay shoe from
      ],
    );
  }
}
