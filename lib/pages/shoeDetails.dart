import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:timberfy/models/shoe.dart';
import 'package:timberfy/pages/similarShoes.dart';

class shoeDetails extends StatefulWidget {
  final Shoe shoe;

  const shoeDetails({super.key, required this.shoe});

  @override
  State<shoeDetails> createState() => _shoeDetailsState();
}

class _shoeDetailsState extends State<shoeDetails> {
  late PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50, left: 8, right: 8),

        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color.fromARGB(255, 233, 233, 234),
              ),

              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        //bacck arrow
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),

                          //adding tap effects to the back button
                          child: GestureDetector(
                            //open previous page with navigator.pop
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.arrow_back_rounded,
                              size: 35,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        //heart button
                        Icon(Icons.favorite_border, size: 35),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: widget.shoe.imagePath.length,
                      itemBuilder: (context, index) {
                        return Hero(
                          tag: "${widget.shoe.hashCode}-$index",
                          child: Image.asset(
                            widget.shoe.imagePath[index],
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: widget.shoe.imagePath.length,
                    effect: WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 5,
                      activeDotColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            //column to hold content below the image
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                //shoe name
                Text(
                  widget.shoe.name,
                  style: GoogleFonts.oswald(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 1), //shoe price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.shoe.price}",
                      style: GoogleFonts.oswald(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 189, 189, 191),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 5),
                Text(
                  widget.shoe.mainDescription,

                  style: GoogleFonts.montserrat(fontSize: 18),
                ),

                SizedBox(height: 10),
                Text(
                  "Similar shoes",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                similarShoes(),

                SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
