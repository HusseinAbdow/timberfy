import 'package:postgres/postgres.dart';

class Shoe {
  late final int id;
  late final String name;
  late final String mainDescription;
  late final String briefDescription;
  late final double price;
  late final String gender;
  late final String type;
  late final List<String> imagePath;
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

  factory Shoe.fromRow(PostgreSQLResultRow row) {
    final m = row.toColumnMap();

    return Shoe(
      id: m["shoeid"],
      name: m["name"],
      mainDescription: m["maindescription"],
      briefDescription: m["briefdescription"],
      gender: m["gender"],
      type: m["type"],
      price: double.parse(m["price"].toString()), // <-- FIXED
      imagePath: List<String>.from(m["image_paths"] ?? []),
    );
  }
}
