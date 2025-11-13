import 'package:flutter/material.dart';
import 'package:timberfy/shoe%20Display/womenBoots.dart';
import 'package:timberfy/shoe%20Display/womenLowBoots.dart';
import 'package:timberfy/shoe%20Display/womenSneakers.dart';

class womenShoeTile extends StatelessWidget {
  const womenShoeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: const [
              Tab(text: "Sneakers"),
              Tab(text: "Boots"),
              Tab(text: "Low Boots"),
            ],
            indicatorColor: Colors.black,
            labelColor: Colors.black,
          ),
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
