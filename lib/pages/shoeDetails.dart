import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:timberfy/configs/database.dart';
import 'package:timberfy/models/shoe.dart';
import 'package:timberfy/pages/similarShoes.dart';

// Shoe details page
// Displays selected shoe images, info, likes and cart actions
class shoeDetails extends StatefulWidget {
  final Shoe shoe;

  const shoeDetails({super.key, required this.shoe});

  @override
  State<shoeDetails> createState() => _shoeDetailsState();
}

class _shoeDetailsState extends State<shoeDetails> {
  // Controls image slider
  late PageController _controller;

  // Controls like (favorite) icon state
  late ValueNotifier<bool> isLikedNotifier;

  // Controls add-to-cart button state
  late ValueNotifier<bool> isInCartNotifier;

  @override
  void initState() {
    super.initState();

    // Initialize page controller for images
    _controller = PageController();

    // Initial like state
    isLikedNotifier = ValueNotifier<bool>(false);

    // Check if shoe is already liked
    DatabaseHelper.instance.isLiked(widget.shoe.id).then((value) {
      isLikedNotifier.value = value;
    });

    // Initial cart state
    isInCartNotifier = ValueNotifier<bool>(false);

    // Check if shoe is already in cart
    DatabaseHelper.instance.isInCart(widget.shoe.id).then((value) {
      isInCartNotifier.value = value;
    });
  }

  @override
  void dispose() {
    // Dispose controllers and notifiers to avoid memory leaks
    _controller.dispose();
    isLikedNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Top padding to avoid notch / status bar
        padding: EdgeInsets.only(top: 50, left: 8, right: 8),
        child: Column(
          children: [
            // ---- IMAGE & ACTIONS CONTAINER ----
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color.fromARGB(255, 233, 233, 234),
              ),
              child: Column(
                children: [
                  // ---- TOP BAR (BACK + LIKE) ----
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back arrow button
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),

                          // Adding tap effect to back button
                          child: GestureDetector(
                            // Go back to previous page
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.arrow_back_rounded,
                              size: 35,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        // Like / unlike button
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

                                // Update only the icon state
                                isLikedNotifier.value = !isLiked;
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

                  // ---- SHOE IMAGES SLIDER ----
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
                              : "shoe-${widget.shoe.id}-$index", // unique tag for other images
                          child: Image.asset(
                            widget.shoe.imagePath[index],
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    ),
                  ),

                  // ---- IMAGE PAGE INDICATOR ----
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

            // ---- DETAILS BELOW IMAGE ----
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),

                // Shoe name
                Text(
                  widget.shoe.name,
                  style: GoogleFonts.oswald(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 1),

                // Price and rating row
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

                // Shoe description
                Text(
                  widget.shoe.mainDescription,
                  style: GoogleFonts.montserrat(fontSize: 18),
                ),

                SizedBox(height: 10),

                // Similar shoes title
                Text(
                  "Similar shoes",
                  style: GoogleFonts.oswald(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                // Widget that displays similar shoes list
                similarShoes(shoe: widget.shoe),

                SizedBox(height: 40),

                // ---- ADD TO CART BUTTON ----
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
