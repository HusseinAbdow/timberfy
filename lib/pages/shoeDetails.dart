import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberfy/models/shoe.dart';

class shoeDetails extends StatelessWidget {
  final Shoe shoe;

  const shoeDetails({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    Icon(Icons.favorite_border, size: 35),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Hero(
                    tag: shoe.hashCode,
                    child: SizedBox(
                      height: 300,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Image.asset(
                        shoe.imagePath.first,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    shoe.name,
                    style: GoogleFonts.oswald(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    shoe.mainDescription,

                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
