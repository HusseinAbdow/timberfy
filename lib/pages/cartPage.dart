import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberfy/configs/database.dart';
import 'package:timberfy/models/shoe.dart';

// Cart page screen
// This page is responsible for showing items added to the cart
class cartPage extends StatefulWidget {
  const cartPage({super.key});

  @override
  State<cartPage> createState() => _CartPageState();
}

class _CartPageState extends State<cartPage> {
  // Holds all shoes currently in the cart
  List<Shoe> _cartItems = [];

  // Used to control loading UI while fetching data
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    // Load cart items as soon as the page is created
    _loadCart();
  }

  // Fetch cart data from local database
  void _loadCart() async {
    final items = await DatabaseHelper.instance.getCartItems();
    setState(() {
      _cartItems = items;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Shortcut for database instance
    final db = DatabaseHelper.instance;

    return Scaffold(
      body: Column(
        children: [
          // Page header text
          Text(
            "My cart",
            style: GoogleFonts.oswald(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          // ---- LOADING STATE ----
          // Shown while cart data is still loading
          if (_loading)
            const Expanded(child: Center(child: CircularProgressIndicator()))
          // ---- EMPTY CART STATE ----
          // Shown when there are no items in the cart
          else if (_cartItems.isEmpty)
            const Expanded(
              child: Center(
                child: Text(
                  "Your cart is empty",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          // ---- CART CONTENT ----
          // Shows item list, total price and buy button
          else
            Expanded(
              child: Column(
                children: [
                  // List of cart items
                  Expanded(
                    child: ListView.builder(
                      itemCount: _cartItems.length,
                      itemBuilder: (context, index) {
                        final shoe = _cartItems[index];

                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                // Shoe image preview
                                SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: Image.asset(
                                    shoe.imagePath.first,
                                    fit: BoxFit.contain,
                                  ),
                                ),

                                const SizedBox(width: 12),

                                // Shoe name and price
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        shoe.name,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        "${shoe.price} ₺",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Delete item from cart
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () async {
                                    await db.removeFromCart(shoe.id);

                                    // Remove item locally to update UI instantly
                                    setState(() {
                                      _cartItems.removeAt(
                                        index,
                                      ); // 💚 smooth update
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // ---- TOTAL PRICE ----
                  // Calculates total price of all items in cart
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total:",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${_cartItems.fold<double>(0, (sum, item) => sum + item.price)} ₺",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ---- BUY BUTTON ----
                  // Final action button for completing purchase
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Buy Now",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
