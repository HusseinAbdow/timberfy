import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:timberfy/configs/database.dart';
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
  late ValueNotifier<bool> isLikedNotifier;
  late ValueNotifier<bool> isInCartNotifier;

  @override
  void initState() {
    super.initState();

    _controller = PageController();

    isLikedNotifier = ValueNotifier<bool>(false);

    DatabaseHelper.instance.isLiked(widget.shoe.id).then((value) {
      isLikedNotifier.value = value;
    });
    isInCartNotifier = ValueNotifier<bool>(false);

    DatabaseHelper.instance.isInCart(widget.shoe.id).then((value) {
      isInCartNotifier.value = value;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    isLikedNotifier.dispose();
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
                        ValueListenableBuilder<bool>(
                          valueListenable: isLikedNotifier,
                          builder: (context, isLiked, _) {
                            return GestureDetector(
                              onTap: () async {
                                if (isLiked) {
                                  await DatabaseHelper.instance.unlikeShoe(
                                    widget.shoe.id,
                                  );
                                } else {
                                  await DatabaseHelper.instance.likeShoe(
                                    widget.shoe.id,
                                  );
                                }

                                isLikedNotifier.value =
                                    !isLiked; // updates ONLY icon
                              },
                              child: Icon(
                                isLiked
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 35,
                                color: isLiked ? Colors.red : Colors.black,
                              ),
                            );
                          },
                        ),
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
                          tag: index == 0
                              ? "shoe-${widget.shoe.id}" // MUST MATCH LIST PAGE
                              : "shoe-${widget.shoe.id}-$index", // different tag for other photos
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
                  style: GoogleFonts.oswald(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),

                //class that displays similar shoes
                similarShoes(shoe: widget.shoe),

                SizedBox(height: 40),
                ValueListenableBuilder<bool>(
                  valueListenable: isInCartNotifier,
                  builder: (context, inCart, _) {
                    return GestureDetector(
                      onTap: () async {
                        if (!inCart) {
                          await DatabaseHelper.instance.addToCart(
                            widget.shoe.id,
                          );
                          isInCartNotifier.value = true;
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: inCart ? Colors.green : Colors.black,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            inCart ? "Added ✔" : "Add to Cart",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
