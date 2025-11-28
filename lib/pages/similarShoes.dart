import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:timberfy/configs/database.dart';
import 'package:timberfy/models/shoe.dart';
import 'package:timberfy/pages/shoeDetails.dart';

class similarShoes extends StatelessWidget {
  final Shoe shoe;
  final db = DatabaseHelper.instance;

  similarShoes({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Shoe>>(
      future: (() async {
        await db.connect();
        return db.getShoes(gender: shoe.gender, type: shoe.type);
      })(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No similar shoes found.'));
        }

        final similar = snapshot.data!;

        return SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: similar.length,
            separatorBuilder: (_, __) => SizedBox(width: 12),
            itemBuilder: (context, index) {
              final s = similar[index];

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 350),
                      pageBuilder: (_, __, ___) => shoeDetails(shoe: s),
                      transitionsBuilder: (_, animation, __, child) {
                        return SharedAxisTransition(
                          animation: animation,
                          secondaryAnimation: animation,
                          transitionType: SharedAxisTransitionType.scaled,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Color.fromARGB(255, 222, 222, 225),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      s.imagePath.first,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
