import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnify/Auth/database_service.dart';
import 'package:learnify/Colors/colors.dart';
import 'package:learnify/Screens/sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  DatabaseService _db = DatabaseService();
  bool _hidePassword = true;
  bool _isLoading = false;

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
                    'Create Account',
                    style: GoogleFonts.lato(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  top: 260,
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
                            'Full Name',
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
                              controller: _fullNameController,
                              decoration: InputDecoration(
                                hintText: 'your name',
                                icon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 10.0),
                                  child: Icon(Icons.person, color: Colors.black,),
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
                            'Phone Number',
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
                              controller: _phoneNumberController,
                              keyboardType: TextInputType.number, // Sets the keyboard to numeric
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly, // Allows only numeric input
                              ],
                              decoration: InputDecoration(
                                hintText: 'Phone Number',
                                icon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 10.0),
                                  child: Icon(Icons.call, color: Colors.black,),
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
                            height: 40,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                _isLoading = true;
                              });
                              _storeData();
                            },
                            label: _isLoading ?  CircularProgressIndicator(backgroundColor: AppColors.background,)
                                :  Text(
                              "Sign Up",
                              style: GoogleFonts.lato(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryGreen,
                                foregroundColor: Colors.white),
                            icon: const Icon(
                              Icons.new_label_outlined,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Already have an account? ",
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500)
                                  ),
                                  TextSpan(
                                    text: "Sign in",
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        color: AppColors.primaryGreen,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.underline
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                      print('going to signin page');
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => SignIn()),
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

  _storeData() async {
    String msg = '';
    try {
      if (_formKey.currentState!.validate()) {
        msg = await _db.addUser(email: _emailController.text,
            name: _fullNameController.text,
            number: int.parse(_phoneNumberController.text),
            password: _passwordController.text);
        if (msg == 'success') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(
              'Data stored successfully, Sign In to continue',
              style: TextStyle(fontSize: 16, color: Colors.black),),
              backgroundColor: Colors.white,),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignIn()),
          );
        }
      } else {
        msg = 'Please fill out all the fields!';
      }
    } catch(e) {
     msg = e.toString();
    }
    setState(() {
      _isLoading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg,
          style: TextStyle(fontSize: 14, color: Colors.black),),
          backgroundColor: Colors.white,)
    );
  }
}
