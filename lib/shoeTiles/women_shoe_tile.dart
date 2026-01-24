import 'package:flutter/material.dart';

// importing women shoe category screens
import 'package:timberfy/shoe%20Display/womenBoots.dart';
import 'package:timberfy/shoe%20Display/womenLowBoots.dart';
import 'package:timberfy/shoe%20Display/womenSneakers.dart';

class womenShoeTile extends StatelessWidget {
  const womenShoeTile({super.key});

  @override
  Widget build(BuildContext context) {
    // DefaultTabController handles tab switching automatically
    // length is the number of tabs we have
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          // built-in TabBar for switching between shoe categories
          TabBar(
            tabs: const [
              // each tab represents one shoe type
              Tab(text: "Sneakers"),
              Tab(text: "Boots"),
              Tab(text: "Low Boots"),
            ],
            // styling for the selected tab indicator
            indicatorColor: Colors.black,
            labelColor: Colors.black,
          ),

          // TabBarView displays the widget that matches the selected tab
          // order here must match the order of the tabs above
          Expanded(
            child: TabBarView(
              children: [womenSneakers(), womenBoots(), womenLowBoots()],
            ),
          ),
        ],
      ),
    );
  }
}
