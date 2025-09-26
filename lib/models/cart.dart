import 'package:timberfy/models/shoe.dart';

class Cart {
  final List<Shoe> _shoes = [
    // ---------------- MEN SHOES ----------------

    // Sneakers
    Shoe(
      name: "Green Stride Blue",
      mainDescription:
          "Premium Timberland® leather meets eco-conscious cushioning. Breathable comfort and rugged outsole for everyday adventures.",
      briefDescription: "Step bold in blue",
      gender: 'male',
      type: 'sneakers',
      price: '168.00',
      imagePath: [
        "lib/assets/images/men/sneakers/greenstride-blue1.png",
        "lib/assets/images/men/sneakers/greenstride-blue2.png",
        "lib/assets/images/men/sneakers/greenstride-blue3.png",
      ],
    ),
    Shoe(
      name: "Green Stride Red",
      mainDescription:
          "Durable design with striking red accents, built to stand out while providing lasting comfort.",
      briefDescription: "Energy in every step.",
      gender: 'male',
      type: 'sneakers',
      price: '175.00',
      imagePath: [
        "lib/assets/images/men/sneakers/greenstride-red1.png",
        "lib/assets/images/men/sneakers/greenstride-red2.png",
        "lib/assets/images/men/sneakers/greenstride-red3.png",
      ],
    ),
    Shoe(
      name: "Green Stride White",
      mainDescription:
          "Clean look, lightweight stride. A modern sneaker for everyday wear.",
      briefDescription: "Pure comfort in white.",
      gender: 'male',
      type: 'sneakers',
      price: '160.00',
      imagePath: [
        "lib/assets/images/men/sneakers/greenstridewhite1.png",
        "lib/assets/images/men/sneakers/greenstridewhite2.png",
        "lib/assets/images/men/sneakers/greenstridewhite3.png",
      ],
    ),
    Shoe(
      name: "Green Stride Brown",
      mainDescription:
          "Premium Timberland® leather meets eco-conscious cushioning. Breathable comfort and rugged outsole for everyday adventures.",
      briefDescription: "Step bold in brown",
      gender: 'male',
      type: 'sneakers',
      price: '168.00',
      imagePath: [
        "lib/assets/images/men/sneakers/greenstride-darkbrown1.png",
        "lib/assets/images/men/sneakers/greenstride-darkbrown2.png",
        "lib/assets/images/men/sneakers/greenstride-darkbrown3.png",
      ],
    ),
    Shoe(
      name: "Motion Scramble Black",
      mainDescription:
          "All-terrain grip with a sleek black look, crafted for motion and durability.",
      briefDescription: "Black style, strong motion.",
      gender: 'male',
      type: 'sneakers',
      price: '190.00',
      imagePath: [
        "lib/assets/images/men/sneakers/motionscramble-black1.png",
        "lib/assets/images/men/sneakers/motionscramble-black2.png",
        "lib/assets/images/men/sneakers/motionscramble-black3.png",
      ],
    ),
    Shoe(
      name: "Motion Scramble",
      mainDescription:
          "Versatile sneaker with modern design, made to adapt to city streets and trails.",
      briefDescription: "Versatility in every step.",
      gender: 'male',
      type: 'sneakers',
      price: '185.00',
      imagePath: [
        "lib/assets/images/men/sneakers/motionscramble1.png",
        "lib/assets/images/men/sneakers/motionscramble2.png",
        "lib/assets/images/men/sneakers/motionscramble3.png",
      ],
    ),

    // Boots
    Shoe(
      name: "Timber Brown",
      mainDescription:
          "Classic Timberland® boot with warm brown leather, rugged outsole for long-lasting wear.",
      briefDescription: "Classic style, timeless strength.",
      gender: 'male',
      type: 'boots',
      price: '210.00',
      imagePath: [
        "lib/assets/images/men/boots/timberbrown1.png",
        "lib/assets/images/men/boots/timberbrown2.png",
        "lib/assets/images/men/boots/timberbrown3.png",
      ],
    ),
    Shoe(
      name: "Timber Dark Brown",
      mainDescription:
          "Deep leather tones combined with durable comfort. Perfect for tough days and tougher style.",
      briefDescription: "Strong look, stronger feel.",
      gender: 'male',
      type: 'boots',
      price: '220.00',
      imagePath: [
        "lib/assets/images/men/boots/timberdarkbrown1.png",
        "lib/assets/images/men/boots/timberdarkbrown2.png",
        "lib/assets/images/men/boots/timberdarkbrown3.png",
      ],
    ),
    Shoe(
      name: "Timber Grey",
      mainDescription:
          "Modern grey finish on a rugged boot silhouette. Blends outdoor strength with urban design.",
      briefDescription: "Grey never looked this bold.",
      gender: 'male',
      type: 'boots',
      price: '215.00',
      imagePath: [
        "lib/assets/images/men/boots/timbergrey1.png",
        "lib/assets/images/men/boots/timbergrey2.png",
        "lib/assets/images/men/boots/timbergrey3.png",
      ],
    ),

    // Low
    Shoe(
      name: "Briton Square",
      mainDescription:
          "Sleek low-cut design for casual comfort. Polished leather finish with modern edges.",
      briefDescription: "Smart, simple, stylish.",
      gender: 'male',
      type: 'low',
      price: '160.00',
      imagePath: [
        "lib/assets/images/men/low/BritionSquare1.png",
        "lib/assets/images/men/low/BritionSquare2.png",
        "lib/assets/images/men/low/BritionSquare3.png",
      ],
    ),
    Shoe(
      name: "Briton Square 2",
      mainDescription:
          "Updated edition of Briton Square with added comfort and flexibility.",
      briefDescription: "Everyday wear, leveled up.",
      gender: 'male',
      type: 'low',
      price: '165.00',
      imagePath: [
        "lib/assets/images/men/low/BritionSquare2-1.png",
        "lib/assets/images/men/low/BritionSquare2-2.png",
        "lib/assets/images/men/low/BritionSquare2-3.png",
      ],
    ),
    Shoe(
      name: "Emerson",
      mainDescription:
          "Casual low shoe built for durability and flexible everyday use.",
      briefDescription: "Comfort that stays.",
      gender: 'male',
      type: 'low',
      price: '150.00',
      imagePath: [
        "lib/assets/images/men/low/emerson1.png",
        "lib/assets/images/men/low/emerson2.png",
        "lib/assets/images/men/low/emerson3.png",
      ],
    ),

    // ---------------- WOMEN SHOES ----------------

    // Sneakers
    Shoe(
      name: "Green Stride Blue (Women)",
      mainDescription:
          "Eco-conscious cushioning meets timeless blue design, made to fit every step.",
      briefDescription: "Bold comfort in blue.",
      gender: 'female',
      type: 'sneakers',
      price: '160.00',
      imagePath: [
        "lib/assets/images/women/sneakers/greenstirde-blue1.png",
        "lib/assets/images/women/sneakers/greenstirde-blue2.png",
        "lib/assets/images/women/sneakers/greenstirde-blue3.png",
      ],
    ),
    Shoe(
      name: "Green Stride Light Green",
      mainDescription:
          "Fresh green tones with lightweight build, perfect for casual days.",
      briefDescription: "Light and fresh comfort.",
      gender: 'female',
      type: 'sneakers',
      price: '165.00',
      imagePath: [
        "lib/assets/images/women/sneakers/greenstride-lightgreen1.png",
        "lib/assets/images/women/sneakers/greenstride-lightgreen2.png",
        "lib/assets/images/women/sneakers/greenstride-lightgreen3.png",
      ],
    ),
    Shoe(
      name: "Green Stride Light Brown",
      mainDescription:
          "Earthy tones blended with soft comfort. Built for long-lasting steps.",
      briefDescription: "Brown elegance, light on feet.",
      gender: 'female',
      type: 'sneakers',
      price: '170.00',
      imagePath: [
        "lib/assets/images/women/sneakers/greenstride-ligjhtbrown1.png",
        "lib/assets/images/women/sneakers/greenstride-ligjhtbrown2.png",
        "lib/assets/images/women/sneakers/greenstride-ligjhtbrown3.png",
      ],
    ),
    Shoe(
      name: "Green Stride White (Women)",
      mainDescription:
          "Minimal white sneaker with maximum comfort, styled for everyday use.",
      briefDescription: "Clean look, pure comfort.",
      gender: 'female',
      type: 'sneakers',
      price: '155.00',
      imagePath: [
        "lib/assets/images/women/sneakers/greenstridewhite1.png",
        "lib/assets/images/women/sneakers/greenstridewhite2.png",
        "lib/assets/images/women/sneakers/greenstridewhite3.png",
      ],
    ),
    Shoe(
      name: "Motion Madsen",
      mainDescription:
          "Active lifestyle sneaker crafted for durability and flexible motion.",
      briefDescription: "Keep moving in style.",
      gender: 'female',
      type: 'sneakers',
      price: '180.00',
      imagePath: [
        "lib/assets/images/women/sneakers/motionMadsen1.png",
        "lib/assets/images/women/sneakers/motionMadsen2.png",
        "lib/assets/images/women/sneakers/motionMadsen3.png",
      ],
    ),

    // Boots
    Shoe(
      name: "Roxie Lane",
      mainDescription:
          "Bold boot design with premium finish, crafted to make a statement.",
      briefDescription: "Own the streets with Roxie.",
      gender: 'female',
      type: 'boots',
      price: '210.00',
      imagePath: [
        "lib/assets/images/women/boots/RoxieLane1.png",
        "lib/assets/images/women/boots/RoxieLane2.png",
        "lib/assets/images/women/boots/RoxieLane3.png",
      ],
    ),
    Shoe(
      name: "Stone Street Brown",
      mainDescription:
          "Earthy tones in a rugged boot silhouette. Made for versatile styling.",
      briefDescription: "Brown roots, bold steps.",
      gender: 'female',
      type: 'boots',
      price: '220.00',
      imagePath: [
        "lib/assets/images/women/boots/stonestreetbrown1.png",
        "lib/assets/images/women/boots/stonestreetbrown2.png",
        "lib/assets/images/women/boots/stonestreetbrown3.png",
      ],
    ),
    Shoe(
      name: "Stone Street Grey",
      mainDescription:
          "Grey leather with a modern twist. Durable outsole for confident movement.",
      briefDescription: "Cool tone, tough step.",
      gender: 'female',
      type: 'boots',
      price: '215.00',
      imagePath: [
        "lib/assets/images/women/boots/stonestreetgrey1.png",
        "lib/assets/images/women/boots/stonestreetgrey2.png",
        "lib/assets/images/women/boots/stonestreetgrey3.png",
      ],
    ),
    Shoe(
      name: "Stone Street White",
      mainDescription:
          "Bright white boots for a standout look. Only two pairs for a minimal vibe.",
      briefDescription: "Shine with every step.",
      gender: 'female',
      type: 'boots',
      price: '225.00',
      imagePath: [
        "lib/assets/images/women/boots/stonestreetwhite2.png",
        "lib/assets/images/women/boots/stonestreetwhite3.png",
      ],
    ),

    // Low
    Shoe(
      name: "Stone Street Low 1",
      mainDescription: "Low cut design, crafted for simplicity and comfort.",
      briefDescription: "Everyday casual wear.",
      gender: 'female',
      type: 'low',
      price: '140.00',
      imagePath: [
        "lib/assets/images/women/low/stoneStreet1-1.png",
        "lib/assets/images/women/low/stoneStreet1-2.png",
        "lib/assets/images/women/low/stoneStreet1-3.png",
      ],
    ),
    Shoe(
      name: "Stone Street Low 2",
      mainDescription:
          "A softer, refined version of the Stone Street with premium comfort.",
      briefDescription: "Style meets simplicity.",
      gender: 'female',
      type: 'low',
      price: '145.00',
      imagePath: [
        "lib/assets/images/women/low/stoneStreet2-1.png",
        "lib/assets/images/women/low/stoneStreet2-2.png",
        "lib/assets/images/women/low/stoneStreet2-3.png",
      ],
    ),
    Shoe(
      name: "Stone Street Low 3",
      mainDescription:
          "Final design of Stone Street series with added durability.",
      briefDescription: "Finish strong, walk light.",
      gender: 'female',
      type: 'low',
      price: '150.00',
      imagePath: [
        "lib/assets/images/women/low/stoneStreet3-1.png",
        "lib/assets/images/women/low/stoneStreet3-2.png",
        "lib/assets/images/women/low/stoneStreet3-3.png",
      ],
    ),
  ];
  List<Shoe> getShoeList() {
    return _shoes;
  }
}
