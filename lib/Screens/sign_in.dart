import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify/Colors/colors.dart';
import 'package:learnify/Screens/home_screen.dart';
import 'package:learnify/Screens/sign_up.dart';

import '../Auth/database_service.dart';
import 'bottom_navigation.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _hidePassword = true;
  bool _isLoading = false;

  DatabaseService _db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight,
              child: Stack(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      height: 300,
                      width: 170,
                      child: Image.asset(
                        'assets/asset1.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      height: 300,
                      width: 170,
                      child: Image.asset(
                        'assets/asset2.png',
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment(0, -0.45),
                  child: Text(
                    'Hello!',
                    style: GoogleFonts.lato(
                        fontSize: 36,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                Align(
                  alignment: Alignment(0, -0.35),
                  child: Text(
                    'Login to your account',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 320,
                  child: Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Email',
                            style: GoogleFonts.lato(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              // Cylindrical border
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  // Shadow color
                                  spreadRadius: 2,
                                  // How far the shadow spreads
                                  blurRadius: 10,
                                  // How soft the shadow is
                                  offset: Offset(0,
                                      5), // Offset: (x, y) - horizontal and vertical
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                hintText: 'youremail@gmail.com',
                                icon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 10.0),
                                  child: Icon(Icons.email_rounded, color: Colors.black,),
                                ),
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xfffD4D4D4),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Password',
                            style: GoogleFonts.lato(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              // Cylindrical border
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  // Shadow color
                                  spreadRadius: 2,
                                  // How far the shadow spreads
                                  blurRadius: 10,
                                  // How soft the shadow is
                                  offset: Offset(0,
                                      5), // Offset: (x, y) - horizontal and vertical
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: _hidePassword,
                              decoration: InputDecoration(
                                hintText: 'abc123',
                                icon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 10.0),
                                  child: Image.asset(
                                    'assets/lock.png',
                                    width: 22,
                                    height: 22,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    (_hidePassword) ? Icons.visibility_off : Icons.visibility,
                                    color: Color(0xfffD4D4D4),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _hidePassword = !_hidePassword;
                                      print('ssuccess');
                                    });
                                  },
                                ),
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xfffD4D4D4),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Forgot password?',
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          ElevatedButton.icon(
                            onPressed: _isLoading
                                ? null // Disable button while loading
                                : () {
                              setState(() {
                                _isLoading = true;
                              });
                              _login();
                            },
                            label: _isLoading
                                ? Text(
                              "Signing In...",
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                                : Text(
                              "Sign In",
                              style: GoogleFonts.lato(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryGreen,
                                foregroundColor: Colors.white),
                            icon: _isLoading
                                ? SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                backgroundColor: AppColors.background,
                              ),
                            )
                                : Icon(Icons.login, color: Colors.white,),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Don't have an account? ",
                                      style: GoogleFonts.lato(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)
                                  ),
                                  TextSpan(
                                      text: "Sign up",
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          color: AppColors.primaryGreen,
                                          fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.underline
                                      ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => SignUp()),
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }

  _login() async {
    String msg = '';
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; // Start loading indicator
      });

      try {
        msg = await _db.verifyCredentials(
          email: _emailController.text,
          password: _passwordController.text,
        );
        if (msg == 'success') {
          setState(() {
            _isLoading = false;
          });
          String name = await _db.getUser(_emailController.text);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigation(name: name)),
          );
          return; // Stop execution here to prevent setting _isLoading to false
        }
      } catch (e) {
        msg = "An error occurred: $e";
      }
    } else {
      msg = "Please fill out both fields.";
    }

    setState(() {
      _isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
