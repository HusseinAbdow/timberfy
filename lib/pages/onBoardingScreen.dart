import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:timberfy/onboardingScreen/onboarding_data.dart';

// Onboarding screen shown when app starts for the first time
class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({super.key});

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  // Controls page view scrolling and page index
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    // Access onboarding images and data
    Quotes quotes = Quotes();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          // Responsive padding based on screen size
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ---- ONBOARDING IMAGES ----
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: quotes.getOnboardImage().length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        quotes.getOnboardImage()[index].imagePath,
                        fit: BoxFit.contain,
                        width: double.infinity,
                      );
                    },
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.05),

                Column(
                  children: [
                    // ---- PAGE INDICATOR ----
                    // Shows current onboarding page with expanding dots
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Colors.black,
                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                    // ---- NEXT BUTTON ----
                    // Moves to next onboarding page or goes to sign-in
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        if (_controller.page == 2) {
                          // Last page reached → go to sign-in screen
                          Navigator.pushReplacementNamed(context, "/signin");
                        } else {
                          // Move to next onboarding page
                          _controller.nextPage(
                            duration: Duration(microseconds: 100),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.3,
                          vertical: MediaQuery.of(context).size.height * 0.02,
                        ),
                        child: Text(
                          "Next",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
