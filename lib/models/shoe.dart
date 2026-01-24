import 'package:postgres/postgres.dart';

// Shoe model class
// This represents a single shoe item coming from the database
class Shoe {
  // Unique ID of the shoe (primary key in database)
  late final int id;

  // Name of the shoe (e.g. "Timberland Classic Boot")
  late final String name;

  // Full detailed description shown on the details page
  late final String mainDescription;

  // Short description used in lists / previews
  late final String briefDescription;

  // Price of the shoe
  late final double price;

  // Gender category (e.g. "male", "female")
  late final String gender;

  // Shoe type (e.g. boots, sneakers, low)
  late final String type;

  // List of image paths stored in assets
  // Using a list allows multiple images per shoe
  late final List<String> imagePath;

  // Constructor requires all fields
  // This ensures every Shoe object is fully initialized
  Shoe({
    required this.id,
    required this.name,
    required this.mainDescription,
    required this.briefDescription,
    required this.gender,
    required this.type,
    required this.price,
    required this.imagePath,
  });

  // Factory constructor to create a Shoe object from a PostgreSQL row
  // This is used when fetching data from the database
  factory Shoe.fromRow(PostgreSQLResultRow row) {
    // Convert database row into a column-name → value map
    final m = row.toColumnMap();

    // Create and return a Shoe object using database values
    return Shoe(
      id: m["shoeid"],
      name: m["name"],
      mainDescription: m["maindescription"],
      briefDescription: m["briefdescription"],
      gender: m["gender"],
      type: m["type"],

      // Price may come as int or string from database
      // Parsing ensures it is always a double in Flutter
      price: double.parse(m["price"].toString()), // <-- FIXED
      // Convert image paths from database to a List<String>
      // Fallback to empty list if null
      imagePath: List<String>.from(m["image_paths"] ?? []),
    );
  }
}
