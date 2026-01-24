import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// SignIn page is Stateless because there is no state changing here
// (no form validation, no controllers, no auth logic yet)
class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    // non functional sign in page
    // just UI layout and navigation demo

    return Scaffold(
      body: SafeArea(
        // SafeArea prevents UI from going under system UI (notch, status bar)
        child: SingleChildScrollView(
          // Allows the page to scroll on smaller screens or when keyboard opens
          child: Column(
            children: [
              SizedBox(
                // Logo width is responsive based on screen size
                width: MediaQuery.of(context).size.width * 0.76,
                child: Image.asset(
                  // Timberland logo image from assets
                  "assets/images/onBoardingImages/timberlandlogo.png",
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),

              // Brand name text
              Text(
                "TIMBERLAND",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 10),

              // Brand slogan text
              Text(
                "Don’t Wear It. Use It.",
                style: GoogleFonts.italiana(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),

              SizedBox(height: 20),

              // Page title
              Text(
                "SIGN IN",
                style: GoogleFonts.oswald(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),

              // Centering the input fields horizontally
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      // Email field container width
                      width: MediaQuery.of(context).size.width * 0.8,

                      child: TextField(
                        // Email input field (no controller yet)
                        decoration: InputDecoration(
                          labelText: "Email",

                          // Icon shown at the start of the input
                          prefixIcon: Icon(Icons.account_circle),
                          hintText: "example@gmail.com",

                          // Border style when NOT focused
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.grey,
                            ),
                          ),

                          // Border style when focused
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    SizedBox(
                      // Password field container width
                      width: MediaQuery.of(context).size.width * 0.8,

                      child: TextField(
                        // Hides password characters
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",

                          // Lock icon for password field
                          prefixIcon: Icon(Icons.lock),
                          hintText: "*********",

                          // Border when not focused
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.grey,
                            ),
                          ),

                          // Border when focused
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Sign In button (acts like a button using GestureDetector)
              GestureDetector(
                onTap: () {
                  // Navigates to home page and removes sign-in from stack
                  Navigator.pushReplacementNamed(context, "/homePage");
                },
                child: Container(
                  // Button width and height
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              SizedBox(
                // Row width for sign-up text
                width: MediaQuery.of(context).size.width * 0.8,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Informational text
                    Text(
                      "Dont have an account?",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 39, 38, 38),
                        fontSize: 17,
                      ),
                    ),

                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),

                    // Sign up text (not clickable yet)
                    Text(
                      "sign up",
                      style: TextStyle(color: Colors.blue, fontSize: 17),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
