import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:timberfy/onboardingScreen/onboarding_data.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({super.key});

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    Quotes quotes = Quotes();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                    //smoothpageindicator
                    //used expanding dots :)
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

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        if (_controller.page == 2) {
                          //send user to signin page
                          Navigator.pushReplacementNamed(context, "/signin");
                        } else {
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
