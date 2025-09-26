import 'package:flutter/material.dart';

class tabBar extends StatelessWidget {
  final void Function(int)? onTap;


tabBar({super.key,  this.onTap, });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: TabBar(
        tabs: [
          Tab(child: Text("Sneakers")),
          Tab(child: Text("Boots")),

          Tab(child: Text("low Boots")),
        ],
        onTap:onTap
      ),
    );
  }
}
