import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    //non functional sign in page

    //just ui

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.76,
                child: Image.asset(
                  "lib/assets/images/onBoardingImages/timberlandlogo.png",
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),

              Text(
                "TIMBERLAND",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Don’t Wear It. Use It.",
                style: GoogleFonts.italiana(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),

              SizedBox(height: 20),

              // SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              Text(
                "SIGN IN",
                style: GoogleFonts.oswald(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,

                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Email",

                          prefixIcon: Icon(Icons.account_circle),
                          hintText: "example@gmail.com",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.grey,
                            ),
                          ),

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
                      width: MediaQuery.of(context).size.width * 0.8,

                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",

                          prefixIcon: Icon(Icons.lock),
                          hintText: "*********",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.grey,
                            ),
                          ),
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

              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/homePage");
                },
                child: Container(
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
                width: MediaQuery.of(context).size.width * 0.8,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Dont have an account?",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 39, 38, 38),
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01),
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
