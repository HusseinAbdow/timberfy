import 'package:timberfy/onboardingScreen/onboard.dart';

// This class is responsible for holding onboarding data
// Right now, it only manages the images shown in the onboarding screens
class Quotes {
  // A list of Onboard objects
  // Each Onboard object represents one onboarding page/image
  // The images are stored in the assets folder and displayed sequentially
  List<Onboard> quotes = [
    Onboard(imagePath: "assets/images/onBoardingImages/image1.png"),
    Onboard(imagePath: "assets/images/onBoardingImages/image2.png"),
    Onboard(imagePath: "assets/images/onBoardingImages/image3.png"),
  ];

  // This method simply returns the onboarding list
  // Useful for keeping data access separate from UI logic
  // So the UI can request onboarding data without knowing how it's stored
  List<Onboard> getOnboardImage() {
    return quotes;
  }
}
