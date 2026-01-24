// This model represents a single onboarding item
// Each item currently holds only an image path
// More fields (title, description, button text, etc.) can be added later
class Onboard {
  // Path to the onboarding image stored in assets
  // Marked as late because it will be initialized through the constructor
  late String imagePath;

  // Constructor requires an imagePath to ensure
  // that every onboarding item has a valid image
  Onboard({required this.imagePath});
}
