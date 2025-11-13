class Shoe {
  late final String name;
  late final String mainDescription;
  late final String briefDescription;
  late final String price;
  late final String gender;
  late final String type;
  late final List<String> imagePath;
  Shoe({
    required this.name,
    required this.mainDescription,
    required this.briefDescription,
    required this.gender,
    required this.type,
    required this.price,
    required this.imagePath,
  });
}
