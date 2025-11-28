import 'package:timberfy/onboardingScreen/onboard.dart';

class Quotes {
  List<Onboard> quotes = [
    Onboard(imagePath: "assets/images/onBoardingImages/image1.png"),
    Onboard(imagePath: "assets/images/onBoardingImages/image2.png"),
    Onboard(imagePath: "assets/images/onBoardingImages/image3.png"),
  ];

  List<Onboard> getOnboardImage() {
    return quotes;
  }
}
